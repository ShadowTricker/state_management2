import 'package:flutter/material.dart';

class StateCateloguePage extends StatelessWidget {

  final List<String> catelogue = [
    'Provider',
    'Redux',
    'Bloc'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management Catelogue'),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: catelogue.length,
      itemBuilder: (BuildContext context, int index) {
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
              Navigator.of(context)
                .pushNamed(
                  '/origin/${catelogue[index].toLowerCase()}',
                  arguments: catelogue[index]
                );
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: .5,
        color: Colors.black12,
      )
    );
  }

}