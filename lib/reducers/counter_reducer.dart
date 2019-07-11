import 'package:redux/redux.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, Increment>(_increment),
  TypedReducer<int, Decrement>(_decrement),
  TypedReducer<int, CounterLoadedAction>(_update),
]);

int _increment(int state, action) {
  return ++state;
}

int _decrement(int state, action) {
  return --state;
}

int _update(int, CounterLoadedAction action) {
  return action.counter;
}
