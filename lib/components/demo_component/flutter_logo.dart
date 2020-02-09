import 'package:flutter/material.dart';

class FlutterLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      padding: EdgeInsets.all(10.0),
      child: FlutterLogo(size: 80.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0)
      ),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }
}
