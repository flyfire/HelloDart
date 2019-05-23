library serializer;

import 'dart:mirrors' show MirrorSystem, ClassMirror, InstanceMirror, MethodMirror, Mirror, reflect, VariableMirror;

Map<Object, SerializedObject> sos;
int counter;

bool isLiteral(o) {
  return o is num || o is bool || o is String || o is Symbol || null == o;
}

List<ClassMirror> superClasses(ClassMirror cm) {
  List<ClassMirror> scs = new List<ClassMirror>();
  ClassMirror scm = cm;
  while(scm != null) {
    scs.add(scm);
    scm = scm.superclass;
  }
  return scs;
}

// 接收对象图的根并将其序列化
List<String> serialize(o) {
  counter = 0;
  sos = new Map<Object, SerializedObject>();
  serializeObject(o);
  List<String> sf = new List<String>(sos.values.length);
  for(var v in sos.values) {
    sf[v.id] = v.toString();
  }
  return sf;
}

SerializedObject serializeObject(o) {
  SerializedObject current = sos[o];
  if(current != null) {
    return current;
  }
  if(isLiteral(o)) {
    return sos[o] = new SerializedLiteral(counter++, o);
  }
  if(o is List) {
    return sos[o] = serializeList(o);
  }
  InstanceMirror im = reflect(o);
  ClassMirror cm  = im.type;
  var res = sos[o] = new SerializedObject(counter++, cm.owner.simpleName, cm.simpleName);
  res.fields = serializeFields(cm, im);
  return res;
}

SerializedList serializeList(List l) {
  SerializedList sl = new SerializedList(counter++, l);
  sl.fields = l.map((e) => serializeObject(e).id).toList();
  return sl;
}

List<int> serializeFields(ClassMirror cm, InstanceMirror im) {
  List<int> fields = new List<int>();
  for(ClassMirror sc in superClasses(cm)) {
    for(Mirror m in sc.declarations.values.where(isInstanceField)) {
      fields.add(serializeObject(im.getField(m.simpleName).reflectee).id);
    }
  }
  return fields;
}

bool isInstanceField(Mirror m) => m is VariableMirror && !m.isStatic;

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