import 'package:flutter/material.dart';
import 'package:state_management2/components/shared_data_widget.dart';
import 'package:state_management2/components/widget_with_state_inherited.dart';
import 'package:state_management2/components/widget_without_state_inherited.dart';

class InheritedWidgetPage extends StatefulWidget {

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();

}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SharedDataWidget(
      data: count,
      action: changeCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Inherited Widget'
          ),
          centerTitle: true,
        ),
        body: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    print(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          WithStateInheritedWidget(),
          WithoutStateInheritedWidget()
        ],
      ),
    );
  }

  changeCount(int count) {
    setState(() {
      this.count = count;
    });
  }

}

