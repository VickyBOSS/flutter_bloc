import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}
