
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management2/components/demo_component/article_item.dart';
import 'package:state_management2/components/demo_component/drawer_component.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

import 'actions/fetch_articles.dart';
import 'models/article_model.dart';

class ManagementReduxArticlesPage extends StatefulWidget {

  // final List<Article> articleList;

  // ManagementReduxArticlesPage(this.articleList);

  @override
  _ManagementReduxArticlesPageState createState() => _ManagementReduxArticlesPageState();

}

class _ManagementReduxArticlesPageState extends State<ManagementReduxArticlesPage> {

  // bool isInit = true;

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
      // drawer: DrawerComponent(logout: _logout),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );

    /* return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        if (isInit) {
          store.dispatch(getArticles(0));
          setState(() {
            isInit = false;
          });
        }
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
          // drawer: DrawerComponent(logout: _logout),
          drawer: _buildDrawer(),
          body: _buildBody(),
        );
      },
    ); */
  }

  Widget _buildDrawer() {
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.author,
      builder: (context, author) {
        return DrawerComponent(logout: _logout, author: author);
      },
    );
  }

  Widget _buildBody() {

    /* return Container(
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.0),
        itemCount: widget.articleList.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem(widget.articleList[index]);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 0.5,
          color: Colors.black26,
        )
      ),
    ); */

    return StoreConnector<AppState, List<Article>>(
      converter: (store) => store.state.articles,
      builder: (context, articles) {
        print(articles);
        return Container(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16.0),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItem(articles[index]);
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

  void _logout() {
    Navigator.of(context).pushReplacementNamed('/redux-login');
  }

}