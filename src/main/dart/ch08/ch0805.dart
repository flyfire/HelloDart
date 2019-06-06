import 'dart:async';

void main() {
  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 3'));
  new Future.delayed(Duration(seconds: 1), () => print('future #1 (delayed)'));
  Future(() => print('future #2 of 4'))
  .then((_) => print('future #2a'))
  .then((_){
    print('future #2b');
    scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
  })
  .then((_) => print('future #2c'));
  scheduleMicrotask(() => print('microtask #2 of 3'));
  Future(() => print('future #3 of 4'))
  .then((_) => Future(() => print('future #3a (a new future)')))
  .then((_) => print('future #3b'));

  Future(() => print('future #4 of 4'))
  .then((_) {
    Future(() => print('future #4a'));
  })
  .then((_) => print('future #4b'));
  scheduleMicrotask(() => print('microtask #3 of 3'));
  print('main #2 of 2');
}

/*
main #1 of 2
main #2 of 2
microtask #1 of 3
microtask #2 of 3
microtask #3 of 3
future #2 of 4
future #2a
future #2b
future #2c
microtask #0 (from future #2b)
future #3 of 4
future #4 of 4
future #4b
future #3a (a new future)
future #3b
future #4a
future #1 (delayed)
 */