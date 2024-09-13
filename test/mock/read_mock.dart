import 'dart:io';

String readMock(String name) => File('test/mock/$name').readAsStringSync();
