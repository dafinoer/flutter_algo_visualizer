abstract class ReactiveRepository<T> {
  Stream<T> watch();

  void dispose();

  void onSetThresholdTime(int durationTime);

  void onSetEvent(T event);

  void onSetNewControllerWhenDispose();
}
