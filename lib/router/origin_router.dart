import 'package:flutter/material.dart';
import 'package:state_management2/containers/bloc/bloc_app.dart';
import 'package:state_management2/containers/origin/async_catelogue.dart';
import 'package:state_management2/containers/origin/bloc_page.dart';
import 'package:state_management2/containers/origin/catelogue.dart';
import 'package:state_management2/containers/origin/downward_data_page.dart';
import 'package:state_management2/containers/origin/eventbus_page.dart';
import 'package:state_management2/containers/origin/inherited_widget_page.dart';
import 'package:state_management2/containers/origin/management_catelogue.dart';
import 'package:state_management2/containers/origin/provider_page.dart';
import 'package:state_management2/containers/origin/redux_page.dart';
import 'package:state_management2/containers/origin/state_catelogue_page.dart';
import 'package:state_management2/containers/origin/state_improvement_page.dart';
import 'package:state_management2/containers/origin/state_props_page.dart';
import 'package:state_management2/containers/redux/redux_app.dart';

Map<String, WidgetBuilder> originRoutes(context) {
  return {
    '/catelogue': (context) => CateloguePage(),
    '/origin/1': (context) => StateAndPropsPage(),
    '/origin/2': (context) => DownwardDataPage(
      text: ModalRoute.of(context).settings.arguments
    ),
    '/origin/3': (context) => StateImprovementPage(),
    '/origin/6': (context) => InheritedWidgetPage(),
    '/origin/7': (context) => EventBusPage(),
    '/origin/9': (context) => StateCateloguePage(),
    '/origin/10': (context) => AsyncCatelogue(),
    '/origin/provider': (context) => ProviderPage(
      title: ModalRoute.of(context).settings.arguments
    ),
    '/origin/redux': (context) => ReduxPage(
      title: ModalRoute.of(context).settings.arguments
    ),
    '/origin/bloc': (context) => BlocPage(
      title: ModalRoute.of(context).settings.arguments
    ),
    '/origin/manage-catelogue': (context) => ManagementCateloguePage(),
    '/redux': (context) => ReduxApp(mainContext: context),
    '/bloc': (context) => BlocApp(mainContext: context)
  };
}