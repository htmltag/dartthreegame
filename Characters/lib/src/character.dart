library characters.base;

import 'package:vector_math/vector_math.dart';

part 'position.dart';

///Character class.
///Holds the properties and methods for a character base.
class Character {
  int width, height, depth, helth;
  double speed;
  Position position;
  String chrType, name;
  bool isHit;
  Vector2 direction;

  Character(this.chrType, this.name, this.helth) {
    this.isHit = false;
    speed = 0.5;
    position = new Position();
    width = 1;
    height = 1;
    depth = 1;
    direction = new Vector2(0.0, 0.0);
  }

  void updatePosition(Position position) {
      this.position.setPositionFromOther(position.getPosition());
    }

  void update() {
    this.position.setPosition(this.position.getPosition().x + direction.x, this.position.getPosition().y, this.position.getPosition().z + direction.y);
  }

  void hit(int damage) {
    if (this.helth > 0) {
      this.helth - damage;
    }
    this.isHit = false;
  }

}
