import 'package:flutter/material.dart';
//import 'package:sensors/sensors.dart';
import 'classes/recorder.dart';
import 'layouts/sensors_recording.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SensorsRecorder",
      home: SensorsRecording(),
      theme: ThemeData(
          primaryColor: Color(0xFF616161),
          primaryColorLight: Color(0xFF8e8e8e),
          primaryColorDark: Color(0xFF373737),
          toggleableActiveColor: Color(0xFF373737),
          buttonColor: Color(0xFF616161),
          textTheme: TextTheme(
              subhead: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
              body1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
              body2: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600),
              button: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600))),
    );
  }
}
