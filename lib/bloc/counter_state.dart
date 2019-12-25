import 'package:bloc_test/models/counter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class InitialCounterState extends CounterState {
  const InitialCounterState();
}

@immutable
class LoadingState extends CounterState {
  const LoadingState();
}

@immutable
class CounterLoadedState extends CounterState {
  final Counter counter;
  const CounterLoadedState(this.counter);
}
