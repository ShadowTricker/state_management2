import 'package:state_management2/constant/counter_event.dart';

int couterReducer(int state, dynamic action) {
  switch(action) {
    case CounterEvent.increment:
      return state + 1;
    case CounterEvent.decrement:
      return state - 1;
    default:
      return state;
  }
}