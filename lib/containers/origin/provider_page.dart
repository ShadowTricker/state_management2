import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management2/components/widget_with_state_provider.dart';
import 'package:state_management2/components/widget_without_state_provider.dart';
import 'package:state_management2/models/provider_dart/count_model.dart';

class ProviderPage extends StatefulWidget {

  final String title;

  ProviderPage({ @required this.title });

  @override
  _ProviderPageState createState() => _ProviderPageState();

}

class _ProviderPageState extends State<ProviderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return ChangeNotifierProvider<CountModel>.value(
      value: CountModel(),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /* Text(
              'SuperCount: ${ Provider.of<CountModel>(context).count }',
              style: TextStyle(
                fontSize: 16.0
              ),
            ), */
            WithStateProviderWidget(),
            WithoutStateProviderWidget()
          ],
        ),
      ),
    );
  }
}