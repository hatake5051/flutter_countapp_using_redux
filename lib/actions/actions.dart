// state; counterをインクリメントするアクション
class Increment {
  const Increment();

  @override
  String toString() {
    return 'Increment';
  }
}

// state; counterをデクリメントするアクション
class Decrement {
  const Decrement();

  @override
  String toString() {
    return 'Decrement';
  }
}

// state; counterをロードし始めるアクション
class LoadCounterAction {
  const LoadCounterAction();

  @override
  String toString() {
    return 'LoadCounterAction';
  }
}

// ロードが完了したことを通知するアクション
class CounterLoadedAction {
  CounterLoadedAction(this.counter);

  final int counter;

  @override
  String toString() {
    return 'CounterLoadedAction($counter)';
  }
}

// ロードに失敗したことを通知するアクション
class CounterLoadedErrorAction {
  CounterLoadedErrorAction(this.e);
  final Exception e;

  @override
  String toString() {
    return 'CounterLoadedErrorAction($e)';
  }
}
