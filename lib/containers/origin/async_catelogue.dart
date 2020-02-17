import 'package:flutter/material.dart';

class AsyncCatelogue extends StatelessWidget {

  final List<String> catelogue = [
    'FutureBuilder', 'StreamBuilder'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Catelogue'),
        centerTitle: true,
      ),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.separated(
      itemCount: catelogue.length,
      itemBuilder: (BuildContext context, int index) {
        print(context);
        final cateIndex = index + 1;
        return Container(
          padding: EdgeInsets.only(left: 10.0),
          child: ListTile(
            title: Text("$cateIndex. ${ catelogue[index] }"),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Navigator.of(context).pushNamed('/origin/$cateIndex');
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0.5,
        color: Colors.black12,
      ),
    );
  }

}