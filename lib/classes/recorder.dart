import 'package:flutter/widgets.dart';
import 'sensorsManager.dart';
import 'tracksManager.dart';
import 'track.dart';
import 'sensor.dart';
import 'package:sensors/sensors.dart';
import 'additional/vector3.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class _Recorder extends StatefulWidget {
  @override
  createState() => _RecorderState();
}

class _RecorderState extends State<_Recorder> {
  var directory;
  bool recordProp1, recordProp2, recordProp3;
  bool _recording = false;
  bool _paused = false;

  get recording {
    return _recording;
  }

  get paused {
    return _paused;
  }

  _RecorderState(
      {this.recordProp1 = false,
      this.recordProp2 = false,
      this.recordProp3 = false});

  void continueRecording() {
    _paused = false;
  }

  void pauseRecording() {
    _paused = true;
  }

  void startRecording() async {
    _recording = true;

    var sensorInitializers = <String, Function>{
      "Accelerometer": (sensor) {},
      "Gyroscope": (sensor) {}
    };

    var availableSensors =
        SensorsManager.sensorsList.where((sensor) => sensor.available);

    for (var sensor in availableSensors)
      sensorInitializers[sensor.name](sensor);
  }

  void stopRecording() async {
    _recording = false;
  }

  @override
  void initState() {
    print(
        "initialized: ${SensorsManager.sensorsList[0].available} ${SensorsManager.sensorsList[1].available}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return null;
  }
}

_RecorderState Recorder = _Recorder().createState();
