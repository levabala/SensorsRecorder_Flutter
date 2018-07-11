import 'package:flutter/material.dart';
import '../../classes/recorder.dart';

class ControlPanel extends StatefulWidget {
  final Recorder recorder;
  ControlPanel({@required this.recorder});
  @override
  createState() => ControlPanelState(recorder: recorder);
}

class ControlPanelState extends State<ControlPanel> {
  final Recorder recorder;
  ControlPanelState({@required this.recorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black12),
          borderRadius: const BorderRadius.all(const Radius.circular(2.0))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Record prop1:"),
                  Switch(
                      value: recorder.recordProp1,
                      onChanged: (value) {
                        setState(() {
                          recorder.recordProp1 = !recorder.recordProp1;
                        });
                      })
                ],
              ),
              RaisedButton(
                textTheme: ButtonTextTheme.primary,
                child: Text("Stop"),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Record prop2:"),
                  Switch(
                      value: recorder.recordProp2,
                      onChanged: (value) {
                        setState(() {
                          recorder.recordProp2 = !recorder.recordProp2;
                        });
                      })
                ],
              ),
              RaisedButton(
                textTheme: ButtonTextTheme.primary,
                child: Text("Pause"),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Record prop3:"),
                  Switch(
                      value: recorder.recordProp3,
                      onChanged: (value) {
                        setState(() {
                          recorder.recordProp3 = !recorder.recordProp3;
                        });
                      })
                ],
              ),
              RaisedButton(
                textTheme: ButtonTextTheme.primary,
                child: Text("Start"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
