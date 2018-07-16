import 'package:flutter/widgets.dart';
import 'model.dart';

class ModelWidget extends InheritedWidget {
  Model model;

  ModelWidget(child) : super(child: child) {
    this.model = Model();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
