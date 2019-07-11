import 'package:countapp_using_container_presentation/models/app_state.dart';
import 'package:countapp_using_container_presentation/reducers/counter_reducer.dart';
import 'package:countapp_using_container_presentation/reducers/is_loading_reduer.dart';
import 'package:countapp_using_container_presentation/reducers/counter_exception_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
    isLoading: isLoadingReducer(state.isLoading, action),
    counterException: counterExceptionReducer(state.counterException, action),
  );
}
