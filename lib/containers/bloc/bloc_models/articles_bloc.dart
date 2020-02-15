import 'package:bloc/bloc.dart';
import 'package:state_management2/containers/bloc/events/articles_event.dart';
import 'package:state_management2/containers/bloc/states/articles_state.dart';
import 'package:state_management2/services/http_service.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {

  @override
  ArticlesState get initialState => ArticlesState(articles: const []);

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is GetArticles) {
      final articles = await HttpService.getArticles();
      yield ArticlesState(articles: articles);
    }
    else if (event is AddArticle) {
      final bool isSuccess = await HttpService.addArticle(event.newItem);
      if (isSuccess) {
        yield ArticlesState(articles: state.articles);
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}