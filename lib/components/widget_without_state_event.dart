import 'package:flutter/material.dart';
import 'package:state_management2/services/event_bus.dart';

class WithoutStateEventWidget extends StatefulWidget {

  @override
  _WithoutStateEventWidgetState createState() => _WithoutStateEventWidgetState();

}

class _WithoutStateEventWidgetState extends State<WithoutStateEventWidget> {

  final EventBus bus = EventBus();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);

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
            'Widget Without State Event Ver.',
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

  @override
  void initState() {
    super.initState();
    bus.on('changeCount', (count) {
      setState(() {
        this.count = count;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('changeCount');
  }

}