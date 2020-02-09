import 'package:flutter/material.dart';

class ManagementReduxInputPage extends StatefulWidget {

  final String pageType;

  ManagementReduxInputPage({ @required this.pageType });

  @override
  _ManagementReduxInputPageState createState() => _ManagementReduxInputPageState();

}

class _ManagementReduxInputPageState extends State<ManagementReduxInputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ${ widget.pageType }',
        ),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          commentInput(),
          buttonArea()
        ],
      ),
    );
  }

  Widget commentInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        autofocus: false,
        maxLines: 8,
        maxLength: widget.pageType == 'Article' ? 1000 : 100,
        maxLengthEnforced: true,
        decoration: InputDecoration(
          hintText: 'Input your ${ widget.pageType.toLowerCase() }',
        )
      ),
    );
  }

  Widget buttonArea() {
    return Container(
      width: double.infinity,
      height: 52.0,
      child: InkWell(
        child: Center(
          child: Text('Submit', style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          )),
        ),
        onTap: () {
          print('Submit');
        },
      ),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }

}