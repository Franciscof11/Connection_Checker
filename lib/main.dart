import 'package:connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ConnectionCheckerCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              context.read<ConnectionCheckerCubit>().checkConnectivity();
            },
            child: const Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
