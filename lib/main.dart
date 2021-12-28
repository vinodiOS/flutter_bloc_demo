import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc_consumer.dart';
import 'package:flutter_bloc_demo/bloc_listener.dart';
import 'package:flutter_bloc_demo/bloc_provider_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc_selector.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter BLoC Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*
        First Step: Create BlocProvider
        It provides instance of BLoc and inject dependency. 

        Examples:
        1. BlocBuilderWidget
        2. BlocListenerWidget
        3. BlocConsumerWidget
        4. BlocSelectorWidget
        */

        home: BlocProvider(
          create: (BuildContext context) => CounterBloc(),
          child: BlocSelectorWidget(),
        ));
  }
}
