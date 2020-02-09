import 'package:flutter/material.dart';
import 'package:state_management2/router/origin_router.dart';

class OriginApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Origin State Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/catelogue',
      routes: originRoutes(context),
    );
  }

}