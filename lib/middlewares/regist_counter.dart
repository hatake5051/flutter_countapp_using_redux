import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:redux/redux.dart';
import 'dart:math';
import 'package:countapp_using_container_presentation/models/app_state.dart';

List<Middleware<AppState>> createMiddlewares() {
  var repo = CounterRepository();
  return [
    TypedMiddleware<AppState, LoadCounterAction>(loadCounter(repo)),
  ];
}

Middleware<AppState> loadCounter(CounterRepository repo) {
  return (Store<AppState> store, action, NextDispatcher next) {
    () async {
      try {
        final counter = await repo.loadCounter();
        store.dispatch(CounterLoadedAction(counter));
      } catch (e) {
        store.dispatch(CounterLoadedErrorAction(e as Exception));
      }
    }();
    next(action);
  };
}

class CounterRepository {
  int counter;

  CounterRepository([int seed]) {
    this.counter = Random(seed).nextInt(20);
  }

  Future<int> loadCounter() async {
    return Future.delayed(Duration(seconds: 3), () {
      if (Random().nextInt(10) > 5) {
        return this.counter;
      } else {
        throw Exception('Cannot load the counter');
      }
    });
  }
}
