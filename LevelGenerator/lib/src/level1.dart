part of LevelGenerator.levels;

class Level1 {
  Ground _ground;
  Wall _wall;
  int width;
  int length;
  int blockHeight;
  int blockWidth;
  int blockDepth;
  int wallBlockHeight;

  Level1(this.width, this.length, this.blockHeight, this.blockWidth, this.blockDepth, this.wallBlockHeight) {
    _ground = new Ground(width, length);
    _wall = new Wall();
  }

  Ground makeGround() {
    for (int i = 0; i < _ground.width; i++) {
      for (int j = 0; j < _ground.length; j++) {
        BuildingBlock block = new BuildingBlock(row: i, col: j, height: blockHeight, width: blockWidth, depth: blockDepth);
        _ground.addBlock(block);
      }
    }

    var rng = new Random();
    for (int index = 0; index < _ground.ground.length - 1; index++) {
      double x = this.blockWidth * this._ground.getBlockAt(index).getCol().toDouble();
      double y = 0.0;
      double z = this.blockDepth * this._ground.getBlockAt(index).getRow().toDouble();
      int counter = rng.nextInt(5);
      if (counter == 1) {
        _ground.setBlockColor(index, 0x48d339);
      } else if (counter == 2) {
        _ground.setBlockColor(index, 0x79d339);
      } else if (counter == 3) {
        _ground.setBlockColor(index, 0x7dea2e);
      } else if (counter == 4) {
        _ground.setBlockColor(index, 0x97e560);
      } else if (counter == 5) {
        _ground.setBlockColor(index, 0xa6ed55);
      } else {
        _ground.setBlockColor(index, 0x2ef41f);
      }
      _ground.setBlockPosition(index, x, y, z);
    }


    return _ground;
  }

  //Wall

  //We are making a wall from the new Ground(20, 20) which is set in the top.
  //That would say that we have a map like this (0 indexed):
  //Row: 0 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 1 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 2 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 3 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 4 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 5 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 6 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 7 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 8 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row: 9 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:10 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:11 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:12 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:13 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:14 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:15 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:16 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:17 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:18 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
  //Row:19 | Col: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19

  Wall makeWall() {
    //Set up some walls
    _wall.addBlock(new BuildingBlock(row: 0, col: 0, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 0, col: 1, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 0, col: 2, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 0, col: 3, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 0, col: 4, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 1, col: 5, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 2, col: 6, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 3, col: 7, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 4, col: 8, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 5, col: 9, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 10, col: 19, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 11, col: 19, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 12, col: 19, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 13, col: 19, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 16, col: 10, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 16, col: 11, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 16, col: 12, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    _wall.addBlock(new BuildingBlock(row: 16, col: 13, height: wallBlockHeight, width: blockWidth, depth: blockDepth));

    var rng = new Random();
    for (int index = 0; index < _wall.wall.length - 1; index++) {
      int counter = rng.nextInt(5) + 1;
      _wall.getBlockAt(index).setHeight(wallBlockHeight * counter);
      double x = this.blockWidth * this._wall.getBlockAt(index).getCol().toDouble();
      double y = _wall.getBlockAt(index).getHeight().toDouble() / 2;
      double z = this.blockDepth * this._wall.getBlockAt(index).getRow().toDouble();

      if (counter == 1) {
        _wall.setBlockColor(index, 0xa5a4a0);
      } else if (counter == 2) {
        _wall.setBlockColor(index, 0x93918b);
      } else if (counter == 3) {
        _wall.setBlockColor(index, 0xa09b8e);
      } else if (counter == 4) {
        _wall.setBlockColor(index, 0x8e897d);
      } else if (counter == 5) {
        _wall.setBlockColor(index, 0x7c776a);
      } else {
        _wall.setBlockColor(index, 0x77705f);
      }
      _wall.setBlockPosition(index, x, y, z);
    }

    return _wall;
  }

  Wall makeRandomWall(){
    Map<String, RandomPair> positions = randomPositions(width, (width * length) ~/ 8);

    positions.forEach((k,v) {
      _wall.addBlock(new BuildingBlock(row: v.v1, col: v.v2, height: wallBlockHeight, width: blockWidth, depth: blockDepth));
    });

    var rng = new Random();
        for (int index = 0; index < _wall.wall.length - 1; index++) {
          int counter = rng.nextInt(5) + 1;
          _wall.getBlockAt(index).setHeight(wallBlockHeight * counter);
          double x = this.blockWidth * this._wall.getBlockAt(index).getCol().toDouble();
          double y = _wall.getBlockAt(index).getHeight().toDouble() / 2;
          double z = this.blockDepth * this._wall.getBlockAt(index).getRow().toDouble();

          if (counter == 1) {
            _wall.setBlockColor(index, 0xa5a4a0);
          } else if (counter == 2) {
            _wall.setBlockColor(index, 0x93918b);
          } else if (counter == 3) {
            _wall.setBlockColor(index, 0xa09b8e);
          } else if (counter == 4) {
            _wall.setBlockColor(index, 0x8e897d);
          } else if (counter == 5) {
            _wall.setBlockColor(index, 0x7c776a);
          } else {
            _wall.setBlockColor(index, 0x77705f);
          }
          _wall.setBlockPosition(index, x, y, z);
        }


    return _wall;
  }

  Map<String, RandomPair> randomPositions(int max, int amount){
    return randomPoints(max, amount);
  }

  Map<String, RandomPair> randomPoints(int max, int amount){
    Map<String, RandomPair> randomMap = new Map<String, RandomPair>();

    var rng = new Random();
    var rng2 = new Random();
    while(randomMap.length < amount){
      int value = rng.nextInt(max);
      int value2 = rng2.nextInt(max);
      String k = "key:" + value.toString() + ":" + value2.toString();
      if(!randomMap.containsKey(k)){
        randomMap[k] = new RandomPair(value, value2);
      }
    }

      return randomMap;
  }

}

class RandomPair{
  int v1;
  int v2;

  RandomPair(this.v1, this.v2);
}
