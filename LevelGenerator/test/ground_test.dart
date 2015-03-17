library LevelGenerator.test;

import 'package:unittest/unittest.dart';
import 'package:LevelGenerator/LevelGenerator.dart';

main() {
  group('Ground tests', () {
    Ground ground;

    setUp(() {
      ground = new Ground(10, 10);
    });

    test('add block test', () {
      BuildingBlock block = new BuildingBlock(row: 0, col: 0, height: 50, width: 50);
      ground.addBlock(block);
      expect(ground.getBlockAt(0).getCol(), block.getCol());
    });

    test('number of length', (){
      expect(ground.length, 10);
    });

  });
}

