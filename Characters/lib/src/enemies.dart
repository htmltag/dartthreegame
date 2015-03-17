library characters.enemies;

import 'dart:math';
import 'package:vector_math/vector_math.dart';
import 'character.dart';


class Enemies{
  List<Character> characters;
  int numberOfEnemies;
  int levelWidth, levelLength, groundHeight;
  double x = 0.1, z = 0.1;
  
  Enemies(this.numberOfEnemies, this.levelWidth, this.levelLength, this.groundHeight){
    characters = new List<Character>();
    this._generateEnemies();
  }

  void update(){
    for(int i = 0; i < this.numberOfEnemies; i++){
          Character chr = characters[i];
          this._updateDirection(chr);
          chr.update();
        }
  }

  void _updateDirection(Character chr){
   
    if(chr.position.getPosition().x > levelWidth){
      x = x - chr.speed;
    }else if (chr.position.getPosition().x < 0.0){
      x = x + chr.speed;
    }
    
    if(chr.position.getPosition().z > levelLength){
      z = z - chr.speed;
    }else if (chr.position.getPosition().z < levelLength){
      z = z + chr.speed;
    }
        
    chr.direction = new Vector2(x, z);
  }

  void _generateEnemies(){
    for(int i = 0; i < this.numberOfEnemies; i++){
      Character chr = new Character("enemi", "$i", 5);
      chr.updatePosition(_randomPosition());
      chr.speed = 0.01;
      this.characters.add(chr);
    }
  }

  Position _randomPosition(){
     Random rnd = new Random();
     double x = rnd.nextInt(this.levelWidth).toDouble();
     double z = rnd.nextInt(this.levelLength).toDouble();
     double y = this.groundHeight.toDouble();
     return new Position(x: x, y: y, z: z);
  }

}