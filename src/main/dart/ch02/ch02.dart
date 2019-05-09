import 'dart:core';
import '../ch01/ch01.dart';

var c = SolarexPoint(5, 6);
main() {
  print(null.runtimeType);
//  hi;
  var a = SolarexPoint(3, 4);
  var b = SolarexPoint(3, 4);
  print(identical(a, b));
  print(identical(a, a));
  print(identityHashCode(a));
  print(identityHashCode(c));
  print(identityHashCode(Cat.HI));
  var d;
  var e;
  print(identityHashCode(d));
  print(identityHashCode(e));
  print(identityHashCode(null));
  print(d);
  print(e);
  print(identityHashCode(Null));
  print("Null == d -> ${Null == d}" );
  print("Null == e -> ${Null == e}");
  print("d == null -> ${d == null}");
  print("e == null -> ${e == null}");
  print("d == e -> ${d == e}");
  print(d.runtimeType);
//  print(Null.runtimeType);
  print(e.runtimeType.runtimeType);
}

class Cat {
  static final HI = "hi";
}

class DeadCat extends Cat {
  DeadCat() {
    print('dead');
  }
}

class LiveCat extends Cat {
  LiveCat() {
    print('live');
  }
}

var hi = new LiveCat();
