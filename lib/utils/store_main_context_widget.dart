import 'package:flutter/material.dart';

class ShareMainContextWidget extends InheritedWidget {

  ShareMainContextWidget({
    @required this.mainContext,
    Widget child
  }): super(child: child);

  final BuildContext mainContext;

  static ShareMainContextWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(ShareMainContextWidget old) {
    return false;
  }

}