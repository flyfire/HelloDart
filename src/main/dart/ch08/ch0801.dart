import 'dart:isolate';
main() {
  ReceivePort rp = new ReceivePort();
  SendPort sp = rp.sendPort;
  Isolate.spawnUri(new Uri(path: './ch0802.dart'), [], sp);
  print('isolate = ${Isolate.current.debugName}');
}