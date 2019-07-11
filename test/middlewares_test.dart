import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:redux/redux.dart';

import 'package:countapp_using_container_presentation/middlewares/regist_counter.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';

class MockRepo extends Mock implements CounterRepository {}

main() {
  test('test fow loadCounter', () async {
    final repo = MockRepo();
    final store = Store<AppState>(
      (AppState state, action) => state,
      initialState: AppState(),
      middleware: [loadCounter(repo)],
    );
    const loadValue = 0;
    when(repo.loadCounter()).thenAnswer((_) => Future.value(loadValue));
    store.dispatch(LoadCounterAction());
    verify(repo.loadCounter());
    await untilCalled(store.dispatch(CounterLoadedAction(loadValue)));

    final loadException = Exception('dummy');
    when(repo.loadCounter()).thenAnswer((_) => Future.error(loadException));
    store.dispatch(LoadCounterAction());
    verify(repo.loadCounter());
    await untilCalled(store.dispatch(CounterLoadedErrorAction(loadException)));
  });
}
