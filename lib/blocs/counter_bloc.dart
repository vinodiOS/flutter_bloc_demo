import 'package:flutter_bloc_demo/blocs/counter_event.dart';
import 'package:flutter_bloc_demo/blocs/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, false)) {
    on<IncrementEvent>(_onIncrementCounter);
    on<DecrementEvent>(_onDecrementCounter);
  }

  Future<void> _onIncrementCounter(
      IncrementEvent event, Emitter<CounterState> emit) async {
    /*
    async task demo
    */
    //await Future.delayed(const Duration(seconds: 1));
    var counter = state.counter + 1;
    emit(CounterState(counter, (counter > 9) ? true : false));
  }

  _onDecrementCounter(DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter - 1, false));
  }
}
