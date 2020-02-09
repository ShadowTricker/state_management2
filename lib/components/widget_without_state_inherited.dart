import 'package:flutter/material.dart';
import 'package:state_management2/components/shared_data_widget.dart';

class WithoutStateInheritedWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(context);
    final int count = SharedDataWidget.of(context).data;

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Widget Without State Inherit Ver.',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child:  Text(
                'count: $count',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
            ),
          )
        ],
      ),
    );
  }

}