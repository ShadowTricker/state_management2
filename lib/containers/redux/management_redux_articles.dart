
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management2/components/demo_component/article_item.dart';
import 'package:state_management2/components/demo_component/drawer_component.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/models/common/models/article_model.dart';

import 'actions/fetch_articles.dart';

class ManagementReduxArticlesPage extends StatelessWidget {

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
              final Map<String, dynamic> arguments = {
                'pageType': 'Article'
              };

              Navigator.of(context).pushNamed(
                '/redux-submit',
                arguments: arguments
              );
            },
          )
        ],
      ),
      drawer: StoreConnector<AppState, String>(
        converter: (store) => store.state.author,
        builder: (context, author) {
          return DrawerComponent(logout: _logout, author: author);
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StoreConnector<AppState, List<Article>>(
      onInit: (store) => store.dispatch(getArticles()),
      converter: (store) => store.state.articles,
      builder: (context, articles) {
        return Container(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16.0),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItem(article: articles[index], appType: 'redux');
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 0.5,
              color: Colors.black26,
            )
          ),
        );
      },
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/redux-login');
  }

}
