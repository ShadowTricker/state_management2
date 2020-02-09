
import 'package:flutter/material.dart';
import 'package:state_management2/components/demo_component/article_item.dart';
import 'package:state_management2/components/demo_component/drawer_component.dart';
import 'package:state_management2/services/http_service.dart';

import 'models/article_model.dart';

class ManagementReduxArticlesPage extends StatefulWidget {

  final ResultData articleList;

  ManagementReduxArticlesPage(this.articleList);

  @override
  _ManagementReduxArticlesPageState createState() => _ManagementReduxArticlesPageState();

}

class _ManagementReduxArticlesPageState extends State<ManagementReduxArticlesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/redux-submit',
                arguments: 'Article'
              );
            },
          )
        ],
      ),
      drawer: DrawerComponent(logout: _logout,),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    final articleList = widget.articleList.data.map((data) => Article.fromJson(data)).toList();

    return Container(
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.0),
        itemCount: articleList.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem(articleList[index]);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0.5,
          color: Colors.black26,
        )
      ),
    );

    /* return Container(
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem();
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0.5,
          color: Colors.black26,
        )
      ),
    ); */
  }

  void _logout() {
    Navigator.of(context).pushReplacementNamed('/redux-login');
  }

}