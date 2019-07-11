import 'package:countapp_using_container_presentation/presentations/count_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';

class CounterContainer extends StatelessWidget {
  CounterContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => ViewModel.fromStore(store),
      builder: (context, vm) {
        return CountScreen(
          counter: vm.counter,
          counterException: vm.counterException,
          onReloadTapped: vm.onReloadTapped,
        );
      },
    );
  }
}

@visibleForTesting
class ViewModel {
  final int counter;
  final Exception counterException;
  final void Function() onReloadTapped;

  ViewModel({
    @required this.counter,
    @required this.counterException,
    @required this.onReloadTapped,
  });

  factory ViewModel.fromStore(Store<AppState> store) {
    return ViewModel(
      counter: store.state.counter,
      counterException: store.state.counterException,
      onReloadTapped: () {
        store.dispatch(const LoadCounterAction());
      },
    );
  }

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      o is ViewModel && runtimeType == o.runtimeType && counter == o.counter;

  @override
  int get hashCode => counter.hashCode;
}
