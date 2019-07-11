import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/actions/actions.dart';
import 'package:countapp_using_container_presentation/presentations/loading_indicator.dart';
import 'package:countapp_using_container_presentation/containers/counter_container.dart';

class LoadCounter extends StatelessWidget {
  LoadCounter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      onInit: (Store<AppState> store) {
        store.dispatch(const LoadCounterAction());
      },
      converter: (Store<AppState> store) => ViewModel.fromStore(store),
      builder: (context, vm) {
        return vm.isLoading ? LoadingIndicator() : CounterContainer();
      },
    );
  }
}

@visibleForTesting
class ViewModel {
  final bool isLoading;

  ViewModel({@required this.isLoading});

  factory ViewModel.fromStore(Store<AppState> store) {
    return ViewModel(isLoading: store.state.isLoading);
  }

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      o is ViewModel &&
          runtimeType == o.runtimeType &&
          isLoading == o.isLoading;

  @override
  int get hashCode => isLoading.hashCode;
}
