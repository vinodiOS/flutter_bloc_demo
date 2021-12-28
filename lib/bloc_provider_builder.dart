import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter.dart';

class BlocBuilderWidget extends StatefulWidget {
  const BlocBuilderWidget({Key? key}) : super(key: key);
  @override
  _BlocBuilderWidget createState() => _BlocBuilderWidget();
}

class _BlocBuilderWidget extends State<BlocBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter BLoC Demo'),
        ),
        body: _counterUI(context) //_counterDeepUI(context)
        );
  }

  /*
  Common BlocBuilder widget , this can be used in deep down. 
  */
  _counterUI(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (bloc, state) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  //Get reference if BLoC
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                child: const Icon(Icons.remove),
              ),
              Text(state.counter.toString()),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementEvent());
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }

  /*
    above function with deep integrated BlocBuilder
    */
  _counterDeepUI(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              //Get reference if BLoC
              context.read<CounterBloc>().add(DecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (bloc, state) {
              return Text(state.counter.toString());
            },
          ),
          FloatingActionButton(
            onPressed: () {
              //Get reference if BLoC
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
