import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sub_layouts/recording_sensors.dart';
import 'sub_layouts/control_panel.dart';
import '../classes/recorder.dart';
import 'recorded_tracks.dart';

class SensorsRecording extends StatefulWidget {
  SensorsRecording();
  @override
  createState() => SensorsRecordingState();
}

class SensorsRecordingState extends State<SensorsRecording> {
  SensorsRecordingState();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensors Recording"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.toc),
            onPressed: () {
              Navigator.of(context).push(TracksPageRoute());
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: SensorsToRecord(),
          ),
          ControlPanel()
        ],
      ),
    );
  }
}

class TracksPageRoute extends CupertinoPageRoute {
  TracksPageRoute()
      : super(builder: (BuildContext context) => new RecordedTracks());
}
