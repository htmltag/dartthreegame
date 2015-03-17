library LevelGenerator.block;

import 'package:vector_math/vector_math.dart';

part 'position.dart';


class BuildingBlock {
  int _col, _row, _height, _width, _depth, _color;
  Position _position = new Position();

  BuildingBlock({int row, int col, int height, int width, int depth, double x: 0.0, double y: 0.0, double z: 0.0, int color: 0}) {
    this._row = row;
    this._col = col;
    this._height = height;
    this._width = width;
    this._depth = depth;
    this._position.setPosition(x, y, z);
    this._color = color;
  }

  int getRow() {
    return this._row;
  }

  int getCol() {
    return this._col;
  }

  int getHeight() {
    return this._height;
  }

  void setHeight(int height){
    this._height = height;
  }

  int getWidth() {
    return this._width;
  }

  int getDepth(){
    return this._depth;
  }

  int getColor() {
    return this._color;
  }

  void setColor(int color) {
    this._color = color;
  }

  void setPositionFromVector3({Vector3 other}) {
    this._position.setPositionFromOther(other);
  }

  void setPosition({double x, double y, double z}) {
    this._position.setPosition(x, y, z);
  }

  Position getPosition() {
    return _position;
  }

  double getX() {
    return _position.getPosition().x;
  }

  double getY() {
    return _position.getPosition().y;
  }

  double getZ() {
    return _position.getPosition().z;
  }

}
