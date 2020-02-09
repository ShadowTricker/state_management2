import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/constant/counter_event.dart';
import 'package:state_management2/models/bloc_dart/count_bloc_model.dart';

class WithStateBlocWidget extends StatefulWidget {

  @override
  _WithStateBlocWidgetState createState() => _WithStateBlocWidgetState();

}

class _WithStateBlocWidgetState extends State<WithStateBlocWidget> {

  @override
  Widget build(BuildContext context) {
    print(context);

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget State Bloc Version',
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
                    counterBloc.add(CounterEvent.increment);
                  } 
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.remove,
                  onPressed: () {
                    counterBloc.add(CounterEvent.decrement);
                  } 
                ),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, count) => Text(
                    'count: $count',
                    style: TextStyle(
                      fontSize: 24.0
                    )
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