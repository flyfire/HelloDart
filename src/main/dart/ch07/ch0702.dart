library proxies;

import 'dart:mirrors' show InstanceMirror, reflect;

@proxy class Proxy {
  InstanceMirror im;
  get forwardee => im.reflectee;

  Proxy(f) {
    im = reflect(f);
  }
  @override
  noSuchMethod(Invocation invocation) {
    im.delegate(invocation);
  }
}