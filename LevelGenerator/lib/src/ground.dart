library LevelGenerator.ground;

import 'package:LevelGenerator/src/buildingBlock.dart';

class Ground {
  int width, length;
  List<BuildingBlock> ground;

  Ground(int width, int length) {
    this.width = width;
    this.length = length;
    ground = new List<BuildingBlock>();
  }

  void addBlock(BuildingBlock block) {
    ground.add(block);
  }

  BuildingBlock getBlockAt(int index) {
    return ground.elementAt(index);
  }

  void setBlockColor(int index, int color) {
    ground.elementAt(index).setColor(color);
  }

  void setBlockPosition(int element, num x, num y, num z) {
    ground.elementAt(element).setPosition(x: x, y: y, z: z);
  }

}
