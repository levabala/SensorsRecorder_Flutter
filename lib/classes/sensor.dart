import 'package:flutter/widgets.dart';
import 'dart:async';

class Sensor {
  final String name;
  bool isRecording;
  Stream stream;

  bool get available {
    return stream != null;
  }

  Sensor({@required this.name, this.isRecording = false, this.stream});
}
