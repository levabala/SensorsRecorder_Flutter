import 'package:flutter/material.dart';
import '../classes/track.dart';
import '../classes/tracksManager.dart' show TracksManager;
import 'package:intl/intl.dart' show DateFormat;

var checked_tracks = <Track>[];

class RecordedTracks extends StatefulWidget {
  @override
  createState() => RecordedTracksState();
}

class RecordedTracksState extends State<RecordedTracks> {
  @override
  void initState() {
    TracksManager.generateRandomTracks(15);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recorded tracks"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: TracksManager.tracks.length * 2,
                  itemBuilder: _trackTileBuilder,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        textTheme: ButtonTextTheme.primary,
                        child: Text("Send"),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        textTheme: ButtonTextTheme.primary,
                        child: Text("Delete"),
                        onPressed: () {
                          setState(() {
                            checked_tracks.forEach((track) {
                              TracksManager.removeTrack(track);
                            });
                            checked_tracks.clear();
                          });
                        },
                      ),
                      RaisedButton(
                        textTheme: ButtonTextTheme.primary,
                        child: Text("Reset"),
                        onPressed: () {
                          setState(() {
                            TracksManager.generateRandomTracks(15);
                          });
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget _trackTileBuilder(BuildContext context, int index) {
    if (index.isOdd)
      return Divider(
        height: 1.0,
        color: Colors.black45,
      );

    var i = index ~/ 2;
    if (TracksManager.tracks.length > i) {
      var track = TracksManager.tracks[i];
      return CheckboxListTile(
        title: Text(track.name),
        secondary: Text(
          DateFormat('yyyy-MM-dd-HH:mm:ss').format(track.startTime),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Roboto"),
        ),
        value: checked_tracks.contains(track),
        onChanged: (value) {
          setState(() {
            if (checked_tracks.contains(track))
              checked_tracks.remove(track);
            else
              checked_tracks.add(track);
          });
        },
      );
    } else
      return null;
  }
}
