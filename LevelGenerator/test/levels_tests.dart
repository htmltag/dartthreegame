library LevelGenerator.test;

import 'package:unittest/unittest.dart';
import 'package:LevelGenerator/LevelGenerator.dart';

main() {
  group('Levels tests', () {
    Levels levels;

    setUp(() {
      levels = new Levels(25, 25, 1, 10, 10, 10);
    });

    test('level1 test', () {
      expect(levels.getLevel1Ground().ground.isNotEmpty, true);
    });

  });
}

