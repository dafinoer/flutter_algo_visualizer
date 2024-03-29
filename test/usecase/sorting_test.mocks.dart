// Mocks generated by Mockito 5.3.2 from annotations
// in algovisualizer/test/usecase/sorting_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:algovisualizer/data/repository/reactive_repository.dart' as _i2;
import 'package:algovisualizer/domain/entity/visualizer.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ReactiveRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReactiveRepository extends _i1.Mock
    implements _i2.ReactiveRepository<_i3.Visualizer> {
  @override
  bool get isClose => (super.noSuchMethod(
        Invocation.getter(#isClose),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.Stream<_i3.Visualizer> watch() => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
        ),
        returnValue: _i4.Stream<_i3.Visualizer>.empty(),
        returnValueForMissingStub: _i4.Stream<_i3.Visualizer>.empty(),
      ) as _i4.Stream<_i3.Visualizer>);
  @override
  void onSetThresholdTime(int? durationTime) => super.noSuchMethod(
        Invocation.method(
          #onSetThresholdTime,
          [durationTime],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onSetEvent(_i3.Visualizer? event) => super.noSuchMethod(
        Invocation.method(
          #onSetEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onSetNewControllerWhenDispose() => super.noSuchMethod(
        Invocation.method(
          #onSetNewControllerWhenDispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
