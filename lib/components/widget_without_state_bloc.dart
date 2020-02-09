import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/models/bloc_dart/count_bloc_model.dart';

class WithoutStateBlocWidget extends StatelessWidget {

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
            'Without State Bloc Version',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, count) {
                  return Text(
                    'count: $count',
                    style: TextStyle(
                      fontSize: 24.0
                    )
                  );
                },
              )
            ),
          )
        ],
      ),
    );
  }

}