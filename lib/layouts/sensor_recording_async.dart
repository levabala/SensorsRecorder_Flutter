import 'package:flutter/material.dart';
import '../classes/sensorsManager.dart';

StreamBuilder sensorsLayoutBuilder = StreamBuilder(
  builder: (context, snapshot) => _buildLayout(context),
  stream: SensorsManager.initializeSensorsStreams(),
);

Widget _buildLayout(BuildContext context) {
  print(
      "--- stream update: GYRO: ${SensorsManager.sensorsList[0].available}, ACC: ${SensorsManager.sensorsList[1].available}");

  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
    children: <Widget>[
      Text("asd"),
      Text("qwe"),
      Text("krya"),
    ],
  );
}
