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

  var f = TestPoint3D(1, 2, 3);
  var g = (Type);
  var h = Type;
  print(g);
  print(h);
  print(g.runtimeType);
  print(h.runtimeType);
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

abstract class AbstractPair {
  get first;
  get second => 20;
}

class APair extends AbstractPair{
  @override
  get first => null;

}

class BPair implements AbstractPair {
  @override
  get first => null;

  @override
  get second => null;

}

class TestPoint {
  var a, b;
  TestPoint(x, y) {
    this.a = x;
    this.b = y;
    print("TestPoint");
  }
}

class TestPoint3D extends TestPoint {
  var c;
  TestPoint3D(a, b, c): super(a, b) {
    this.c = c;
    print("TestPoint3D");
  }
}

/*
class TestPoint4D extends TestPoint3D {
  var d;
  TestPoint4D(a, b, c, d) {
    this.d = d;
    super(a, b, c);
  }
}
*/
