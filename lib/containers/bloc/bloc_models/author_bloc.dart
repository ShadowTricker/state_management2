import 'package:bloc/bloc.dart';
import 'package:state_management2/containers/bloc/events/author_event.dart';
import 'package:state_management2/containers/bloc/states/author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {

  @override
  AuthorState get initialState => AuthorState(author: null);

  @override
  Stream<AuthorState> mapEventToState(AuthorEvent event) async* {
    if (event is AuthorEvent) {
      yield AuthorState(author: event.author);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onTransition(Transition<AuthorEvent, AuthorState> transition) {
    print(transition);
  }

}