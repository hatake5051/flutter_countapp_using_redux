import 'package:test/test.dart';
import 'package:redux/redux.dart';

import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';

import 'package:countapp_using_container_presentation/containers/home.dart';

void main() {
  group('home container', () {
    test('corectiveness', () {
      bool add = false;
      bool remove = false;
      final store = Store<AppState>((AppState s, a) {
        if (a is Increment) {
          add = true;
        } else if (a is Decrement) {
          remove = true;
        }
        return s;
      }, initialState: AppState());
      final vm = ViewModel.fromStore(store);
      vm.onAddTapped();
      expect(add, true);
      vm.onRemoveTapped();
      expect(remove, true);
    });
  });
}
