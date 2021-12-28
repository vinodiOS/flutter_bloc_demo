import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/utils/utils.dart';
import 'blocs/counter.dart';

class BlocConsumerWidget extends StatefulWidget {
  const BlocConsumerWidget({Key? key}) : super(key: key);
  @override
  _BlocConsumerWidgetState createState() => _BlocConsumerWidgetState();
}

class _BlocConsumerWidgetState extends State<BlocConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter BLoC Demo'),
        ),
        body: _counterUI(context));
  }
  /*
  BlocConsumer is combination of BlocBuilder and BlocListener
  */

  _counterUI(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(listener: (context, state) {
      if (state.wasHighestLimitReached) {
        Utils().showInSnackBar(context, 'Counter limit reached');
      }
    }, builder: (context, state) {
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
    });
  }
}
