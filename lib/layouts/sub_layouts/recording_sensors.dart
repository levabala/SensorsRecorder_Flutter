import 'package:flutter/material.dart';
import '../../classes/recorder.dart';
import '../../classes/sensorsManager.dart' show SensorsManager;
import '../../classes/sensor.dart';

class SensorsToRecord extends StatefulWidget {
  final Recorder recorder;
  SensorsToRecord({@required this.recorder});
  @override
  createState() => SensorsToRecordState(recorder: recorder);
}

class SensorsToRecordState extends State<SensorsToRecord> {
  final Recorder recorder;
  var streamBuilder;
  SensorsToRecordState({@required this.recorder});

  @override
  void initState() {
    streamBuilder = StreamBuilder(
      builder: (context, snapshot) => _buildLayout(context),
      stream: SensorsManager.initializeSensorsStreams(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return streamBuilder;
  }

  Widget _buildLayout(BuildContext context) {
    print(
        "--- sensors stream update: GYRO: ${SensorsManager.sensorsList[0].available}, ACC: ${SensorsManager.sensorsList[1].available}");
    /*return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      itemCount: SensorsManager.sensorsList.length * 2,
      itemBuilder: _sensorTileBuilder,
    );*/
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      children: _buildSensorTiles(),
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
                  print("sensor is recording: ${sensor.isRecording}");
                });
              }
            : null,
      );
    } else
      return null;
  }

  List<Widget> _buildSensorTiles() {
    List<Widget> tiles = [];
    print("rebuild sensor tiles");

    for (var sensor in SensorsManager.sensorsList) {
      tiles.add(CheckboxListTile(
        title: Text(sensor.name),
        value: sensor.isRecording,
        onChanged: sensor.available
            ? (value) {
                setState(() {
                  sensor.isRecording = !sensor.isRecording;
                  print("sensor is recording: ${sensor.isRecording}");
                });
              }
            : null,
      ));
      tiles.add(Divider(
        height: 1.0,
        color: Colors.black45,
      ));
    }

    return tiles;
  }
}
