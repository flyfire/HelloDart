import 'dart:isolate';

main(args, SendPort from) {
  ReceivePort rp = new ReceivePort();
  SendPort sp = rp.sendPort;
  sp.send(from);
  print('isolate = ${Isolate.current.debugName}');
}