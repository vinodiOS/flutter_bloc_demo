import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  final bool wasHighestLimitReached;
  const CounterState(this.counter, this.wasHighestLimitReached);

  @override
  List<Object> get props => [counter];
}
