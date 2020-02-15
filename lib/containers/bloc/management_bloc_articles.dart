
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management2/components/demo_component/article_item.dart';
import 'package:state_management2/components/demo_component/drawer_component.dart';
import 'package:state_management2/containers/bloc/bloc_models/articles_bloc.dart';
import 'package:state_management2/containers/bloc/bloc_models/author_bloc.dart';
import 'package:state_management2/containers/bloc/events/articles_event.dart';
import 'package:state_management2/containers/bloc/states/articles_state.dart';
import 'package:state_management2/models/common/models/article_model.dart';

class ManagementBlocArticlesPage extends StatefulWidget {

  @override
  _ManagementBlocArticlesPageState createState() => _ManagementBlocArticlesPageState();

}

class _ManagementBlocArticlesPageState extends State<ManagementBlocArticlesPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticlesBloc>(context).add(GetArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final Map<String, dynamic> arguments = {
                'pageType': 'Article'
              };

              await Navigator.of(context).pushNamed(
                '/bloc-submit',
                arguments: arguments
              );
              BlocProvider.of<ArticlesBloc>(context).add(GetArticles());
            },
          )
        ],
      ),
      drawer: DrawerComponent(
        logout: _logout,
        author: BlocProvider.of<AuthorBloc>(context).state.author
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        final List<Article> articles = state.articles;
        return Container(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16.0),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItem(article: articles[index], appType: 'bloc');
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 0.5,
              color: Colors.black26,
            )
          ),
        );
      }
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/bloc-login');
  }

}