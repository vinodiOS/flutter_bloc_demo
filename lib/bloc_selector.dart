import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter.dart';

class BlocSelectorWidget extends StatefulWidget {
  const BlocSelectorWidget({Key? key}) : super(key: key);
  @override
  _BlocSelectorWidgetState createState() => _BlocSelectorWidgetState();
}

class _BlocSelectorWidgetState extends State<BlocSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter BLoC Demo'),
        ),
        body: _counterUI(context));
  }

  _counterUI(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocSelector<CounterBloc, CounterState, bool>(
          selector: (state) {
            return state.wasHighestLimitReached;
          },
          builder: (context, state) {
            if (!state) {
              return Text("This will not change until maximum limit reached");
            } else {
              return Text("maximum limit reached!");
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Row(
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
          );
        })
      ],
    ));
  }
}
