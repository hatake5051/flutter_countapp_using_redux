// state; counterをインクリメントするアクション
class Increment {
  const Increment();
}

// state; counterをデクリメントするアクション
class Decrement {
  const Decrement();
}

// state; counterをロードし始めるアクション
class LoadCounterAction {
  const LoadCounterAction();
}

// ロードが完了したことを通知するアクション
class CounterLoadedAction {
  CounterLoadedAction(this.counter);

  final int counter;
}

// ロードに失敗したことを通知するアクション
class CounterLoadedErrorAction {
  CounterLoadedErrorAction(this.e);

  final Exception e;
}
