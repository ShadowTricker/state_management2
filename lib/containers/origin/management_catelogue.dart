import 'package:flutter/material.dart';

class ManagementCateloguePage extends StatelessWidget {

  final List<String> list = [
    'Bloc Version',
    'Redux Version'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Management Catelogue'
        ),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final int cateIndex = index + 1;
        return Container(
          padding: EdgeInsets.only(left: 10.0),
          child: ListTile(
            title: Text(
              '$cateIndex. ${ list[index] }'
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              final String verStr = list[index].split(' ')[0].toLowerCase();
              Navigator.of(context).pushNamed('/$verStr');
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: .5,
        color: Colors.black12,
      ),
    );
  }

}