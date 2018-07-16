import 'package:flutter/material.dart';
import '../classes/model_widget.dart';
import '../classes/model.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      RaisedButton(
          child: Text(
            "Sign in",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            var modelWidget = context.inheritFromWidgetOfExactType(ModelWidget)
                as ModelWidget;
            var model = modelWidget.model;
            model.authModule.initSignInWithGoogle();
          }),
      RaisedButton(
          child: Text(
            "Sign out",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            var modelWidget = context.inheritFromWidgetOfExactType(ModelWidget)
                as ModelWidget;
            var model = modelWidget.model;
            model.authModule.signout();
          }),
    ]);
  }
}
