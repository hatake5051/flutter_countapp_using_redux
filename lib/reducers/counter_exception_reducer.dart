import 'package:redux/redux.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';

final counterExceptionReducer = combineReducers<Exception>([
  TypedReducer<Exception, CounterLoadedErrorAction>(_counterError),
  TypedReducer<Exception, CounterLoadedAction>((Exception, dynamic) => null),
]);

Exception _counterError(Exception _, CounterLoadedErrorAction action) {
  return action.e;
}
