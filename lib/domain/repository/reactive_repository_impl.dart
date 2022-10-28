import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveRepositoryImpl implements ReactiveRepository<Visualizer> {
  PublishSubject<Visualizer> _publishSubject;
  late int _thresHoldTime;

  ReactiveRepositoryImpl(this._publishSubject, this._thresHoldTime);

  factory ReactiveRepositoryImpl.create({int? time}) =>
      ReactiveRepositoryImpl(PublishSubject<Visualizer>(), time ?? 400)
        ..onSetNewControllerWhenDispose();

  @override
  void dispose() {
    _publishSubject.close();
  }

  @override
  void onSetThresholdTime(int durationTime) {
    _thresHoldTime = durationTime;
  }

  @override
  Stream<Visualizer> watch() async* {
    yield* _publishSubject.stream.asyncMap((event) async {
      await Future.delayed(Duration(milliseconds: _thresHoldTime));
      return event;
    });
  }

  @override
  void onSetEvent(Visualizer event) {
    _publishSubject.add(event);
  }

  @override
  void onSetNewControllerWhenDispose() {
    final isClose = _publishSubject.isClosed;
    if (isClose) _publishSubject = PublishSubject<Visualizer>();
  }
}
