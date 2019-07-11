import 'package:meta/meta.dart';

@immutable
class AppState {
  final int counter;
  final bool isLoading;
  final Exception counterException;
  AppState({
    this.counter = 0,
    this.isLoading = false,
    this.counterException,
  });
}
