import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveRepositoryImpl implements ReactiveRepository<Visualizer> {
  late PublishSubject<Visualizer> _publishSubject;
  late int _thresholdTime;

  ReactiveRepositoryImpl(this._thresholdTime);

  factory ReactiveRepositoryImpl.create({int? time}) =>
      ReactiveRepositoryImpl(time ?? 400)..onSetNewControllerWhenDispose();

  @override
  void onSetNewControllerWhenDispose() {
    _publishSubject = PublishSubject<Visualizer>(
      onCancel: () => _publishSubject.close(),
    );
  }

  @override
  Stream<Visualizer> watch() => _publishSubject.stream.asyncMap(
        (event) async {
          await Future.delayed(Duration(milliseconds: _thresholdTime));
          return event;
        },
      );

  @override
  void onSetEvent(Visualizer event) {
    _publishSubject.add(event);
  }

  @override
  void onSetThresholdTime(int durationTime) {
    _thresholdTime = durationTime;
  }

  @override
  bool get isClose => _publishSubject.isClosed;
}
