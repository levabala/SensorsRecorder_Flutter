import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Sensor {
  final String name;
  bool _isRecording = false;
  Stream stream;

  bool get available {
    return stream != null;
  }

  set isRecording(value) {
    _isRecording = value;
  }

  get isRecording {
    return _isRecording;
  }

  Sensor({@required this.name, this.stream});
}
