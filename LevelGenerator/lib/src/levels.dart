library LevelGenerator.levels;

import 'dart:math';
import 'package:LevelGenerator/src/ground.dart';
import 'package:LevelGenerator/src/wall.dart';
import 'package:LevelGenerator/src/buildingBlock.dart';

part 'level1.dart';

class Levels {
  Level1 level1;
  Levels(int width, int length, int blockHeight, int blockWidth, int blockDepth, int wallBlockHeight){
    level1 = new Level1(width, length, blockHeight, blockWidth, blockDepth, wallBlockHeight);
  }

  Ground getLevel1Ground() {
    return level1.makeGround();
  }

  Wall getLevel1Wall(){
    return level1.makeRandomWall();//.makeWall();
  }

}
