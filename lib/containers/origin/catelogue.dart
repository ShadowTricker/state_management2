import 'package:flutter/material.dart';

class CateloguePage extends StatelessWidget {

  final List<String> catelogue = [
    'State & Props（状态 & 属性）', 'Downward Data Flow（单向数据流）', 'State Improvement（状态提升）',
    'Smart | Dumb?（聪明组件 or 笨组件？）', 'Why State Management?（状态管理？）',
    'InheritedWidget（数据共享组件）', 'EventBus（事件总线）', 'BuildContext',
    'Provider, Redux, Bloc and MobX', 'Async in Flutter（UI 异步更新）'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catelogue'),
        centerTitle: true,
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Text(
          'Demo',
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed('/origin/manage-catelogue');
        },
      ),
    );
  }

  Widget _buildBody(context) {
    print(context);

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
              if (cateIndex == 2) {
                Navigator.of(context)
                  .pushNamed('/origin/$cateIndex', arguments: catelogue[index]);
                return;
              }

              if (cateIndex == 4 || cateIndex == 5|| cateIndex == 8) {
                return;
              }

              Navigator.of(context).pushNamed('/origin/$cateIndex');
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