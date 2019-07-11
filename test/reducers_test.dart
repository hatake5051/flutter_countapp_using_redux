import 'package:test/test.dart';

import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  group('counterReducer test', () {
    test('dispatche Increment Action', () {
      final store = storeProvider();
      store.dispatch(const Increment());
      expect(store.state.counter, 1);
    });
    test('dispatch Decrement Action', () {
      final store = storeProvider();
      store.dispatch(const Decrement());
      expect(store.state.counter, -1);
    });

    test('dispatch CounterLoadedAction', () {
      final store = storeProvider();
      store.dispatch(CounterLoadedAction(3));
      expect(store.state.counter, 3);
    });
  });

  group('isLoadingReducer test', () {
    test('dispatch LoadCounterAction', () {
      final store = storeProvider();
      store.dispatch(const LoadCounterAction());
      expect(store.state.isLoading, true);
    });
    test('dispatch ${CounterLoadedAction(0)}', () {
      final store = storeProvider();
      store.dispatch(CounterLoadedAction(0));
      expect(store.state.isLoading, false);
    });
    test('dispatch CounterLoadedErrorAction', () {
      final store = storeProvider();
      store.dispatch(CounterLoadedErrorAction(null));
      expect(store.state.isLoading, false);
    });
  });

  group('counterExceptionReducer test', () {
    test('dispatch CounterLoadedErrorAction', () {
      final store = storeProvider();
      store.dispatch(CounterLoadedErrorAction(Exception('dummy')));
      expect(store.state.counterException.toString(),
          Exception('dummy').toString());
    });

    test('dispatch CounterLoadedAction', () {
      final store = storeProvider();
      store.dispatch(CounterLoadedAction(0));
      expect(store.state.counterException, null);
    });
  });
}

Store<AppState> storeProvider() {
  return Store<AppState>(appReducer, initialState: AppState());
}
