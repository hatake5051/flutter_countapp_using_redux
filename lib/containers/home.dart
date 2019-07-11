import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/presentations/home_screen.dart';

class Home extends StoreConnector<AppState, ViewModel> {
  Home({Key key})
      : super(
          key: key,
          distinct: true,
          converter: (Store<AppState> store) => ViewModel.fromStore(store),
          builder: (context, vm) {
            return HomeScreen(
              onAddTapped: vm.onAddTapped,
              onRemoveTapped: vm.onRemoveTapped,
            );
          },
        );
}

// Dartではprivateなものはテストできないっぽい
// このアノテーションをつけると、テスト以外で使われないようにアナライザがチェックしてくれる
@visibleForTesting
class ViewModel {
  final void Function() onAddTapped;
  final void Function() onRemoveTapped;

  ViewModel({
    @required this.onAddTapped,
    @required this.onRemoveTapped,
  });

  factory ViewModel.fromStore(Store<AppState> store) {
    if (store.state.counterException == null) {
      return ViewModel(onAddTapped: () {
        store.dispatch(const Increment());
      }, onRemoveTapped: () {
        store.dispatch(const Decrement());
      });
    }
    return ViewModel(onAddTapped: null, onRemoveTapped: null);
  }

  @override
  bool operator ==(Object o) =>
      identical(this, o) || o is ViewModel && runtimeType == o.runtimeType;

  @override
  int get hashCode => onAddTapped.hashCode ^ onRemoveTapped.hashCode;
}
