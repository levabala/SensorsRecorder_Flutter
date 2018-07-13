import 'package:flutter/material.dart';
import '../../classes/recorder.dart';

class ControlPanel extends StatefulWidget {
  ControlPanel();
  @override
  createState() => ControlPanelState();
}

class ControlPanelState extends State<ControlPanel> {
  ControlPanelState();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black12),
            borderRadius: const BorderRadius.all(const Radius.circular(2.0))),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(hintText: "track name"),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Record prop1:"),
                      Switch(
                          value: Recorder.recordProp1,
                          onChanged: (value) {
                            setState(() {
                              Recorder.recordProp1 = !Recorder.recordProp1;
                            });
                          })
                    ],
                  ),
                  Recorder.recording
                      ? RaisedButton(
                          color: Theme.of(context).accentColor,
                          textTheme: ButtonTextTheme.primary,
                          child: Text("Stop"),
                          onPressed: () {
                            setState(() {
                              Recorder.stopRecording();
                            });
                          },
                        )
                      : RaisedButton(
                          textTheme: ButtonTextTheme.primary,
                          child: Text("Start"),
                          onPressed: () {
                            setState(() {
                              Recorder.startRecording();
                            });
                          },
                        ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Record prop2:"),
                      Switch(
                          value: Recorder.recordProp2,
                          onChanged: (value) {
                            setState(() {
                              Recorder.recordProp2 = !Recorder.recordProp2;
                            });
                          })
                    ],
                  ),
                  Recorder.paused
                      ? RaisedButton(
                          color: Theme.of(context).accentColor,
                          textTheme: ButtonTextTheme.primary,
                          child: Text("Resume"),
                          onPressed: () {
                            setState(() {
                              Recorder.continueRecording();
                            });
                          },
                        )
                      : RaisedButton(
                          textTheme: ButtonTextTheme.primary,
                          child: Text("Pause"),
                          onPressed: () {
                            setState(() {
                              Recorder.pauseRecording();
                            });
                          },
                        ),
                ],
              ),
            ],
          ),
        ));
  }
}
