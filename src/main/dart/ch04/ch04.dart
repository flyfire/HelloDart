fib(n) {
  lastTwo(n) {
    if(n < 1) {
      var r = [0, 1];
      print("r = $r");
      return r;
    } else {
      var p = lastTwo(n - 1);
      print("p = $p");
      var ret = [p[1], p[0] + p[1]];
      print("ret = $ret");
      return ret;
    }
  }
  return lastTwo(n)[1];
}

main() {
  print(fib(10));
}