import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management2/models/provider_dart/count_model.dart';

class WithStateProviderWidget extends StatefulWidget {

  @override
  _WithStateWidgetProviderState createState() => _WithStateWidgetProviderState();

}

class _WithStateWidgetProviderState extends State<WithStateProviderWidget> {

  @override
  Widget build(BuildContext context) {
    print(context);

    final CountModel countModel = Provider.of<CountModel>(context);

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget With State',
            style: TextStyle(
              fontSize: 24.0
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.add,
                  onPressed: () {
                    final int newCount = countModel.count + 1;
                    countModel.changeCount(newCount);
                  }
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.remove,
                  onPressed: () {
                    final int newCount = countModel.count - 1;
                    countModel.changeCount(newCount);
                  }
                ),
                Text(
                  'count: ${ countModel.count }',
                  style: TextStyle(
                    fontSize: 24.0
                  )
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
    );
  }

  Widget _buildButton({ Color buttonColor, Color fontColor, icon, onPressed }) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: fontColor,
      ),
      decoration: ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
    );
  }

}