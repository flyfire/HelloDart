main() {
//  test(fa); // error
  List<int> l = new List<int>();
  print(l.length);
  
}

int fa(int a, int b, int c) {
  return a+b+c;
}

num fb(num a, num b, num c) {
  return a+b+c;
}

test(num fb(num a, num b, num c)){
  var a = 5.0, b = 6.0, c = 7.0;
  return fb(a, b, c);
}