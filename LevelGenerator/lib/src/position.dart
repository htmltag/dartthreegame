part of LevelGenerator.block;


class Position {
  Vector3 _vector = new Vector3(0.0, 0.0, 0.0);

  Position({num x: 0.0, num y: 0.0, num z: 0.0}) {
    _vector.setValues(x, y, z);
  }

  void setPositionFromOther(Vector3 other) {
    _vector.setFrom(other);
  }

  void setPosition(num x, num y, num z) {
    _vector.setValues(x, y, z);
  }

  Vector3 getPosition() {
    return _vector;
  }

}
