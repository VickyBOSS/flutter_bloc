import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_test/db/app_db.dart';
import 'counter_state.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    yield LoadingState();
    if (event is IncrementCounterEvent) {
      var counter = await AppDB.fetchRandomCounter();
      yield CounterLoadedState(counter);
    }
  }
}
