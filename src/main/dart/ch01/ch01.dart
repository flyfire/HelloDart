library points;

import 'dart:math';

class SolarexPoint {
  var x,y;
  SolarexPoint(this.x, this.y);
  scale(factor) => new SolarexPoint(x*factor, y*factor);
  operator +(p) => new SolarexPoint(x + p.x, y + p.y);
  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }

}


main() {
  print("Hello Dart");
  var p1 = new SolarexPoint(3, 4);
  var p2 = new SolarexPoint(10, 16);
  print(p1.scale(2).y);
  print(p1 + p2);
  print(SolarexPoint.distance(p1, p2));
}