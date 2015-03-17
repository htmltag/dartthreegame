import 'dart:html';
import 'package:LevelGenerator/LevelGenerator.dart';
import 'package:Characters/Characters.dart';
import 'package:three/three.dart' as THREE;
import 'package:three/extras/controls/first_person_controls.dart';
import 'package:vector_math/vector_math.dart' hide Ray;


class Game {

  Element container;
  THREE.PerspectiveCamera camera;
  THREE.Scene scene;
  THREE.WebGLRenderer renderer;
  THREE.DirectionalLight light, light2;
  FirstPersonControls controls;
  THREE.Mesh playerCube, playerCube2;
  static num WIDTH = window.innerWidth,
      HEIGHT = window.innerHeight,
      ASPECT = WIDTH / HEIGHT;

  static num UNITSIZE = 150;
  static num MOVESPEED = 4;
  static num LOOKSPEED = 0.0035;
  List<THREE.Ray> ray;

  //Enemies
  int numOfEnemies = 10;
  Enemies enemies;

  //variables for the level light
  final int levelBlockWidth = 20;
  final int levelBlockLength = 20;
  final int blockHeight = 1;
  final int blockWidth = 40;
  final int blockDepth = 40;
  final int wallBlockHeight = 20;

  double planeWidth;
  double planeHeight;

  //CollisionDetection
  bool playerInterectWall;
  int enemiesAdded;
  List<THREE.Object3D> enemiObj;
  List<THREE.Object3D> blockobj;

  void init() {

    // for CollisionDetection
    this.enemiesAdded = 0;
    enemiObj = new List<THREE.Object3D>();
    blockobj = new List<THREE.Object3D>();
    playerInterectWall = false;

    //sidewall
    planeWidth = levelBlockWidth * blockWidth.toDouble();
    planeHeight = 100.0;

    //Sets up scene, camera and stuff.
    scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2(0x9db3b5, 0.0004); // color, density

    camera = new THREE.PerspectiveCamera(60.0, window.innerWidth / window.innerHeight, 1.0, 10000.0);
    camera.position.y = UNITSIZE * .2;
    camera.position.x = 200.0;
    camera.position.z = 100.0;

    scene.add(camera);

    playerCube = new THREE.Mesh(new THREE.CubeGeometry(10.0, 20.0, 10.0), new THREE.MeshBasicMaterial(color: 0xfaff00));
    scene.add(playerCube);

    //Generate level
    generateWorld();

    //GenerateEnemies
    generateEnemies();

    //Add level light
    setLevelLight();

    container = new Element.tag('span');
    document.body.nodes.add(container);

    renderer = new THREE.WebGLRenderer(antialias: false)..setSize(window.innerWidth, window.innerHeight);

    container.nodes.add(renderer.domElement);

    controls = new FirstPersonControls(camera, renderer.domElement);
    controls.movementSpeed = MOVESPEED;
    controls.lookSpeed = LOOKSPEED;
    controls.lookVertical = false; // Temporary solution; play on flat surfaces only
    controls.mouseDragOn = true;

    window.onResize.listen(onWindowResize);
  }

  onWindowResize(event) {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    renderer.setSize(window.innerWidth, window.innerHeight);
  }


  void generateWorld() {
    Levels level1 = new Levels(this.levelBlockWidth, this.levelBlockLength, this.blockHeight, this.blockWidth, this.blockDepth, this.wallBlockHeight);

    //Set up the floor/ground
    Ground ground = level1.getLevel1Ground();
    for (int i = 0; i < ground.ground.length - 1; i++) {
      BuildingBlock block = ground.getBlockAt(i);
      var floorBlock = new THREE.Mesh(new THREE.CubeGeometry(block.getWidth().toDouble(), block.getHeight().toDouble(), block.getDepth().toDouble()), new THREE.MeshLambertMaterial(color: block.getColor()));
      floorBlock.position.setFrom(block.getPosition().getPosition());
      floorBlock.receiveShadow = true;
      scene.add(floorBlock);
    }

    //Set up the walls
    Wall wall = level1.getLevel1Wall();
    for (int i = 0; i < wall.wall.length - 1; i++) {
      BuildingBlock block = wall.getBlockAt(i);
      var wallBlock = new THREE.Mesh(new THREE.CubeGeometry(block.getWidth().toDouble(), block.getHeight().toDouble(), block.getDepth().toDouble()), new THREE.MeshPhongMaterial(color: 0xc2d1d3));
      wallBlock.position.setFrom(block.getPosition().getPosition());
      wallBlock.castShadow = true;
      wallBlock.receiveShadow = true;
      wallBlock.name = "wallblock";
      scene.add(wallBlock);
    }

    var sideWall1 = new THREE.Mesh( new THREE.PlaneGeometry(this.planeWidth, this.planeHeight), new THREE.MeshLambertMaterial(color: 0xe08b3c));
    var sideWall2 = new THREE.Mesh( new THREE.PlaneGeometry(this.planeWidth, this.planeHeight), new THREE.MeshLambertMaterial(color: 0xe08b3c));
    var sideWall3 = new THREE.Mesh( new THREE.PlaneGeometry(this.planeWidth, this.planeHeight), new THREE.MeshLambertMaterial(color: 0xe08b3c));
    var sideWall4 = new THREE.Mesh( new THREE.PlaneGeometry(this.planeWidth, this.planeHeight), new THREE.MeshLambertMaterial());

    //Turn walls to make walls around the level.
    sideWall1.position.setValues(this.planeWidth / 2 - this.blockWidth / 2, this.planeHeight / 2, -this.blockWidth / 2);
    scene.add(sideWall1);

    sideWall2.doubleSided = true;
    sideWall2.position.setValues(this.planeWidth / 2 - this.blockWidth / 2, this.planeHeight / 2, this.levelBlockLength * this.blockDepth - this.blockWidth / 2);
    sideWall2.rotation.x = THREE.degToRad(180);
    scene.add(sideWall2);

    sideWall3.position.setValues(0.0 - this.blockWidth / 2, this.planeHeight / 2, this.levelBlockLength * this.blockDepth / 2 - this.blockWidth / 2);
    sideWall3.rotation.y = THREE.degToRad(90);
    scene.add(sideWall3);

    sideWall4.position.setValues(this.planeWidth - this.blockWidth / 2, this.planeHeight / 2, this.levelBlockLength * this.blockDepth / 2 - this.blockWidth / 2);
    sideWall4.rotation.y = THREE.degToRad(270);
    scene.add(sideWall4);
  }

  void generateEnemies(){
    loadEnemiObj(numOfEnemies);
    enemies = new Enemies(numOfEnemies, levelBlockWidth * blockWidth, levelBlockLength * blockDepth, blockHeight);
  }

  //Level light
  void setLevelLight(){
    light = new THREE.DirectionalLight(0xffffff, 0.2)
            //x, y, z = depth, up, side
            ..castShadow = true
            ..shadowDarkness = 0.03
            ..shadowMapHeight = levelBlockWidth * blockWidth
            ..shadowMapWidth = levelBlockWidth * blockWidth
            ..position.setValues(levelBlockWidth.toDouble() * blockWidth, 400.0, (levelBlockWidth * blockWidth) / 2.0)
            ..shadowCameraFar = 600
            ..shadowCameraLeft = -(levelBlockWidth * blockWidth) / 2
            ..shadowCameraRight = (levelBlockWidth * blockWidth) / 2
            ..shadowCameraTop = (levelBlockWidth * blockWidth) / 2
            ..shadowCameraBottom = -(levelBlockWidth * blockWidth) / 2.0;
        scene.add(light);

        light2 = new THREE.DirectionalLight(0xffffff, 0.2)
            //x, y, z = depth, up, side
            ..castShadow = true
            ..shadowDarkness = 0.03
            ..shadowMapHeight = levelBlockWidth * blockWidth
            ..shadowMapWidth = levelBlockWidth * blockWidth
            ..position.setValues(levelBlockWidth.toDouble(), 400.0, (levelBlockWidth * blockWidth) / 2.0)
            ..shadowCameraFar = 600
            ..shadowCameraLeft = -(levelBlockWidth * blockWidth) / 2
            ..shadowCameraRight = (levelBlockWidth * blockWidth) / 2
            ..shadowCameraTop = (levelBlockWidth * blockWidth) / 2
            ..shadowCameraBottom = -(levelBlockWidth * blockWidth) / 2.0;
        scene.add(light2);
  }

  void loadEnemiObj(int number) {

    // texture

    var texture = new THREE.Texture();

    var loaderTexture = new THREE.ImageLoader();

    loaderTexture.addEventListener('load', (event) {
      texture.image = event.content;
      texture.needsUpdate = true;
    });

    loaderTexture.load('textures/man_texture0.png');


    //model
    for(int i = 0; i < number; i++){
    THREE.Object3D object;
    var loader = new THREE.OBJLoader();
     loader.load( 'obj/man.obj').then(( object ) {

       object.children.forEach((e) {
         if (e is THREE.Mesh) {
           ((e as THREE.Mesh).material as THREE.MeshLambertMaterial).map = texture;
         }
       });
       object.name = "enemi";
       object.castShadow = true;
       object.rotation.x = -1.5;
       object.position.y = 0.0;
       object.position.x = 200.0 + (this.enemiesAdded * 10);
       object.position.z = 200.0 + (this.enemiesAdded * 10);
       object.rotation.z = 0.3;
       scene.add(object);
       this.enemiesAdded++;
     } );
    }

  }

  void updateEnemies(){
    if(this.enemiesAdded == numOfEnemies){

      if(enemiObj.length < 1){
      scene.objects..forEach((value){
        if(value.name == "enemi"){
          enemiObj.add(value);
        }
      } );
      }

      this.enemies.update();
      for(int i = 0; i < numOfEnemies; i++){
      if(enemiObj[i] != null){
      var enemi = enemies.characters.elementAt(i);
      enemiObj[i].position.setFrom(enemi.position.getPosition());
      }
    }
    }
  }

  void collisionDetection(){

    if(blockobj.length < 1){
          scene.objects..forEach((value){
            if(value.name == "wallblock"){
              blockobj.add(value);
            }
          } );
    }
    double distance = blockWidth.toDouble() / 4;
    if(blockobj.length > 0 && ray != null){
      for(int i = 0; i < ray.length; i++){
       List<THREE.Intersect> intersects = ray[i].intersectObjects( blockobj );

         if ( intersects.length > 0 ) {
           THREE.Intersect intersect = intersects[0];
           if(intersect.distance <= distance){
             playerInterectWall = true;
           }else{
             playerInterectWall = false;
           }
         }
      }
      }

  }

  void animate(num time) {
    window.requestAnimationFrame(animate);
    controls.update(1.0);
    updateEnemies();
    collisionDetection();

    if(this.controls != null && ray == null){
      Vector3 vector = this.controls.target.clone().sub(this.controls.object.position).normalize();
      ray = new List<THREE.Ray>();
      ray.add(new THREE.Ray(this.controls.object.position, vector.sub(camera.position).normalize()));
    }

    if(this.playerInterectWall == true){
      this.controls.moveForward = false;
    }

    render();
  }

  void render() {
    renderer.render(scene, camera);
  }

}

void main() {
  Game game = new Game();
  game.init();
  game.animate(0);
}
