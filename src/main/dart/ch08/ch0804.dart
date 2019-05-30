class S {
  a() {
    print('S.a');
  }
}

class A {
  a() {
    print('A.a');
  }

  b() {
    print('A.b');
  }
}

class T = A with S;

main() {
  T t = new T();
  t.a();
  t.b();
}
