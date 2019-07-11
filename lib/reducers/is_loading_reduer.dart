import 'package:redux/redux.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';

final isLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadCounterAction>((bool, action) => true),
  TypedReducer<bool, CounterLoadedAction>((bool, action) => false),
  TypedReducer<bool, CounterLoadedErrorAction>((bool, action) => false),
]);
