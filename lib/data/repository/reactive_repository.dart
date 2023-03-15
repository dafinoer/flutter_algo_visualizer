abstract class ReactiveRepository<T> {
  Stream<T> watch();

  bool get isClose;

  void onSetThresholdTime(int durationTime);

  void onSetEvent(T event);

  void onSetNewControllerWhenDispose();
}
