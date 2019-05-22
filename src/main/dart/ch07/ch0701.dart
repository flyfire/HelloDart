import 'dart:mirrors' show reflectClass,ClassMirror,MirrorSystem;

class SuperClass {
  int superField = 0;
  final int superFinalField = 1;
  int get superGetter => 2;
  set superSetter(x) {}
  int superMethod(x) => 4;
  static int superStaticField = 5;
  static final int superStaticFinalField = 6;
  static const int superStaticConstField = 7;
  static int get superStaticGetter => 8;
  static set superStaticSetter(x) {}
  static int superStaticMethod(x) => 10;
}

class SelfPrinting extends SuperClass {
  int aField = 11;
  final int aFinalField = 12;
  get aGetter => 13;
  set aSetter(x) {}
  int aMethod(x) => 15;
  static int staticField = 16;
  static final int staticFinalField = 17;
  static const int staticConstField = 18;
  static int get staticGetter => 19;
  static set staticSetter(x) {}
  static int staticMethod(x) => 20;
}


main() {
  ClassMirror cm = reflectClass(SelfPrinting);
  for(Symbol memberName in cm.instanceMembers.keys) {
    print('$memberName');
  }
  print('------------');
  for(Symbol memberName in cm.instanceMembers.keys) {
    print('${MirrorSystem.getName(memberName)}');
  }
  print('------------');
  for(Symbol memberName in cm.staticMembers.keys) {
    print('$memberName');
  }
  print('------------');
  for(Symbol memberName in cm.staticMembers.keys) {
    print('${MirrorSystem.getName(memberName)}');
  }
}