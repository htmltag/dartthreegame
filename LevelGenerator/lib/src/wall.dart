library LevelGenerator.wall;

import 'package:LevelGenerator/src/buildingBlock.dart';

class Wall {
  List<BuildingBlock> wall;

  Wall() {
    wall = new List<BuildingBlock>();
  }

  void addBlock(BuildingBlock block) {
    wall.add(block);
  }

  BuildingBlock getBlockAt(int index) {
    return wall.elementAt(index);
  }

  void setBlockColor(int index, int color) {
    wall.elementAt(index).setColor(color);
  }

  void setBlockPosition(int element, num x, num y, num z) {
    wall.elementAt(element).setPosition(x: x, y: y, z: z);
  }


}
