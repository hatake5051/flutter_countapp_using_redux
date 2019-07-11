import 'package:test/test.dart';
import 'package:redux/redux.dart';

import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';

import 'package:countapp_using_container_presentation/containers/counter_container.dart';

void main() {
  group('Counter container', () {
    test('ViewModel correctiveness', () {
      final store = Store<AppState>((AppState state, action) {
        // dummy reducer
        if (action is LoadCounterAction) {
          return AppState(counter: 10);
        }
      },
          initialState: AppState(
            counterException: Exception('dummy'),
          ));

      final vm = ViewModel.fromStore(store);
      expect(vm.counter, 0);
      expect(vm.counterException.toString(), Exception('dummy').toString());
      final subscription = store.onChange.listen((AppState state) {
        expect(state.counter, 10);
      });
      vm.onReloadTapped();
      subscription.cancel();
    });
    test('ViewModel identitial', () {
      final store0 = Store<AppState>(null, initialState: AppState());
      final store1 = Store<AppState>(null, initialState: AppState());
      final store2 = Store<AppState>(null, initialState: AppState(counter: 2));
      final vm0 = ViewModel.fromStore(store0);
      final vm1 = ViewModel.fromStore(store1);
      final vm2 = ViewModel.fromStore(store2);
      expect(identical(vm0, vm1), false);
      expect(vm0 == vm1, true);
      expect(vm0 == vm2, false);
    });
  });
}
