library Characters.test;

import 'package:Characters/Characters.dart';
import 'package:unittest/unittest.dart';

main() {
  group('Enemies tests', () {
    Enemies enemies;
    int numOfEnemies;
    int levelBlockWidth;
    int levelBlockLength;
    int blockHeight;
    int blockWidth;
    int blockDepth;
    int wallBlockHeight;

    setUp(() {
      numOfEnemies = 1;
      levelBlockWidth = 20;
      levelBlockLength = 20;
      blockHeight = 1;
      blockWidth = 40;
      blockDepth = 40;
      wallBlockHeight = 20;
    });

    test('Enemi Test', () {
      enemies = new Enemies(numOfEnemies, levelBlockWidth * blockWidth, levelBlockLength * blockDepth, blockHeight);
      expect(enemies.characters.length, 1);
    });


  });
}
