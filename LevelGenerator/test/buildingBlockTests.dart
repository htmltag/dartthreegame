library LevelGenerator.test;

import 'package:unittest/unittest.dart';
import 'package:vector_math/vector_math.dart';
import 'package:LevelGenerator/LevelGenerator.dart';

main() {
  group('Buildingblock tests', () {
    BuildingBlock bb;

    setUp(() {
      bb = new BuildingBlock(row: 0, col: 0, height: 50, width: 50);
    });

    test('getHeight test', () {
      expect(bb.getHeight(), 50);
    });

    test('getWidth test', () {
      expect(bb.getWidth(), 50);
    });

    test('getX test', () {
      expect(bb.getX(), 0.0);
    });

    test('getY test', () {
      expect(bb.getY(), 0.0);
    });

    test('getZ test', () {
      expect(bb.getZ(), 0.0);
    });

    test('getColor test', () {
      expect(bb.getColor(), 0);
    });

    test('getRow test', () {
      expect(bb.getRow(), 0);
    });

    test('getCol test', () {
      expect(bb.getCol(), 0);
    });

    test('getPosition test', () {
      Vector3 v3 = new Vector3(0.0, 0.0, 0.0);
      bb.setPositionFromVector3(other: v3);
      expect(bb.getPosition().getPosition().x, v3.x);
    });
  });
}
