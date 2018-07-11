import 'package:flutter/widgets.dart';

class Track {
  String name;
  String dataPath;
  DateTime startTime, endTime;

  Track({@required this.name, this.startTime, this.endTime});
}
