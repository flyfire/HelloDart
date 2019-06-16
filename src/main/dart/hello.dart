import 'dart:math';

import 'package:HelloDart/HelloDart.dart' as HelloDart;

main(List<String> arguments) {
  var a;
  print(a??"solarex");
  print('Hello world: ${HelloDart.calculate()}!');
  print('hello dart from solarex');
  print([].isEmpty);
  print(['a'].length);
  print(twice(5));
  var arr = [1, 3, -1, 8, 7, 100];
  print(maxElement(arr));
}

twice(x) => x*2;

maxElement(List<int> a) {
  var currentMax = a.isEmpty ? throw 'Maximal element undefined for empty array' : a[0];
  for (int i = 0; i < a.length; i++) {
    currentMax = max(a[i], currentMax);
  }
  return currentMax;
}

class Point extends Object{
  var x,y;
  Point(this.x, this.y);

  scale(factor) => new Point(x*factor, y*factor);
  operator +(p) => new Point(x + p.x, y+p.y);

  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class MPoint {
  var rho, theta;

  MPoint(a,b) {
    rho = sqrt(a*a + b*b);
    theta = atan(a/b);
  }

  get x => rho * cos(theta);
  set x(newX) {
    rho = sqrt(newX*newX + y*y);
    theta = acos(newX/rho);
  }

  get y => rho * sin(theta);
  set y(newY) {
    rho = sqrt(x*x + newY*newY);
    theta = asin(newY/rho);
  }

  scale(factor) => new Point(rho*factor, theta);
  operator +(p) => new Point(x + p.x, y + p.y);

  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx*dx + dy*dy);
  }
}