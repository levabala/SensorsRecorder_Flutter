import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersPanel extends StatefulWidget {
  @override
  createState() => UsersPanelState();
}

class UsersPanelState extends State<UsersPanel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StreamBuilder(
      stream: Firestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text("Still loading...");

        print(snapshot.data.documents.length);
        return ListView.builder(
          itemCount: snapshot.data.documents.length * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();

            var index = i ~/ 2;
            var doc = snapshot.data.documents[index];
            return ListTile(
              title: Text("User: ${doc["name"]}  Tracks: ${doc["tracks"]}"),
            );
          },
        );
      },
    );
  }
}
