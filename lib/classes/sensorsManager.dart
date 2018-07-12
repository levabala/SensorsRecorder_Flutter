import 'sensor.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:flutter/widgets.dart';
import 'package:observable/observable.dart';

class _SensorsWidget extends StatefulWidget {
  @override
  createState() => _SensorsWidgetState();
}

class _SensorsWidgetState extends State<_SensorsWidget> {
  bool streams_initialized = false;
  var sensorsList = <Sensor>[
    Sensor(name: "Gyroscope"),
    Sensor(name: "Accelerometer"),
    Sensor(name: "Proximity"),
    Sensor(name: "Gravity"),
    Sensor(name: "Magnetic Field"),
    Sensor(name: "Orientation"),
    Sensor(name: "Temperature"),
    Sensor(name: "Lineral Acceleration"),
    Sensor(name: "Pressure"),
    Sensor(name: "One More Sensor"),
    Sensor(name: "Unknown Sensor"),
    Sensor(name: "I don't know what's that"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Stream<Sensor> initializeSensorsStreams() async* {
    //init gyroscope
    var gyro = sensorsList.firstWhere((sensor) => sensor.name == "Gyroscope");
    gyro.stream = gyroscopeEvents;
    yield gyro;

    //init accelerometer
    var acc =
        sensorsList.firstWhere((sensor) => sensor.name == "Accelerometer");
    acc.stream = accelerometerEvents;
    yield acc;

    streams_initialized = true;
  }
}

_SensorsWidgetState SensorsManager = _SensorsWidgetState();
