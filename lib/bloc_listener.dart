import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/utils/utils.dart';
import 'blocs/counter.dart';

class BlocListenerWidget extends StatefulWidget {
  const BlocListenerWidget({Key? key}) : super(key: key);
  @override
  _BlocListenerWidgetState createState() => _BlocListenerWidgetState();
}

class _BlocListenerWidgetState extends State<BlocListenerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter BLoC Demo'),
        ),
        body: _counterUI(context));
  }
  /*
  Listener is used for change in state to avoid UI issues 
  Used to show snackbar and Navigation
  */

  _counterUI(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state.wasHighestLimitReached) {
          Utils().showInSnackBar(context, 'Counter limit reached');
        }
      },
      child: BlocBuilder<CounterBloc, CounterState>(
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
      ),
    );
  }
}
