import 'package:flutter/material.dart';
import 'dart:async';
import '../classes/sensorsManager.dart';

StreamBuilder layoutBuilder = StreamBuilder(
  builder: (context, snapshot) => _buildLayout(context),
);

Widget _buildLayout(BuildContext context) {
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
