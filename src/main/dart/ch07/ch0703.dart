library serializer;

import 'dart:mirrors' show MirrorSystem, ClassMirror, InstanceMirror, MethodMirror, Mirror, reflect, VariableMirror;

Map<Object, SerializedObject> sos;

bool isLiteral(o) {
  return o is num || o is bool || o is String || o is Symbol || null == o;
}

class SerializedObject {
  final int id;
  final Symbol libName;
  final Symbol className;
  List<int> fields;
  SerializedObject(this.id, this.libName, this.className);
  @override
  String toString() {
    String args = (fields.map((a) => a.toString())).fold('', (s, e) => "$s $e");
    return '${MirrorSystem.getName(libName)}/${MirrorSystem.getName(className)}($args)';
  }
}

class SerializedLiteral implements SerializedObject {
  @override
  List<int> get fields => [];
  set fields(f) {}

  @override
  Symbol get className => #literal;

  @override
  Symbol get libName => #literal;

  final int id;
  final literal;
  SerializedLiteral(this.id, this.literal);

  @override
  String toString() => literal is String ? '"$literal"' : literal.toString();
}

class SerializedList implements SerializedObject {
  final int id;
  List<int> fields;
  SerializedList(this.id, List l) {
    fields = l.map((e) => serializeObject(e).id).toList();
  }

  @override
  Symbol get className => #List;

  @override
  Symbol get libName => #literal;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.writeAll(['[']);
    for(int f in fields) {
      buffer.writeAll([f, ' ']);
    }
    buffer.writeAll([']']);
    return buffer.toString();
  }
}