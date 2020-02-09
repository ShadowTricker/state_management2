import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/components/widget_with_state_bloc.dart';
import 'package:state_management2/components/widget_without_state_bloc.dart';
import 'package:state_management2/models/bloc_dart/count_bloc_model.dart';

class BlocPage extends StatefulWidget {

  final String title;

  BlocPage({ @required this.title });

  @override
  _BlocPageState createState() => _BlocPageState();

}

class _BlocPageState extends State<BlocPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'SuperCount: $count',
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                WithStateBlocWidget(),
                WithoutStateBlocWidget()
              ],
            );
          },
        ),
        
      ),
    );
    
  }

}