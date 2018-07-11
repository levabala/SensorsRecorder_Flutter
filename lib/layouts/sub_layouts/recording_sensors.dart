import 'package:flutter/material.dart';
import '../../classes/recorder.dart';
import '../../classes/sensorsManager.dart' show SensorsManager;
import '../../classes/sensor.dart';
import 'dart:async';

class SensorsToRecord extends StatefulWidget {
  final Recorder recorder;
  SensorsToRecord({@required this.recorder});
  @override
  createState() => SensorsToRecordState(recorder: recorder);
}

class SensorsToRecordState extends State<SensorsToRecord> {
  final Recorder recorder;
  SensorsToRecordState({@required this.recorder});

  void listenForStreams() async {
    Future listen(Stream<Sensor> stream) async {
      await for (var sensor in stream) {
        setState(() {
          print("Sensor \"${sensor.name}\" initialized");
        });
      }
    }

    listen(SensorsManager.initializeSensorsStreams());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      itemCount: SensorsManager.sensorsList.length * 2,
      itemBuilder: _sensorTileBuilder,
    );
  }

  Widget _sensorTileBuilder(BuildContext context, int index) {
    if (index.isOdd)
      return Divider(
        height: 1.0,
        color: Colors.black45,
      );

    var i = index ~/ 2;
    if (SensorsManager.sensorsList.length > i) {
      var sensor = SensorsManager.sensorsList[i];
      return CheckboxListTile(
        title: Text(sensor.name),
        value: sensor.isRecording,
        onChanged: sensor.available
            ? (value) {
                setState(() {
                  sensor.isRecording = !sensor.isRecording;
                });
              }
            : null,
      );
    } else
      return null;
  }

  List<Widget> _buildSensorTiles() {
    List<Widget> tiles = [];
    SensorsManager.sensorsList.forEach((Sensor sensor) {
      tiles.add(CheckboxListTile(
        title: Text(sensor.name),
        value: sensor.isRecording,
        onChanged: sensor.available
            ? (value) {
                setState(() {
                  sensor.isRecording = !sensor.isRecording;
                });
              }
            : null,
      ));
      tiles.add(Divider(
        height: 1.0,
        color: Colors.black45,
      ));
    });
    return tiles;
  }
}
