import 'package:connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:connection_checker/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ConnectionCheckerCubit()
          ..checkConnectivity()
          ..trackConnectivityChange(),
        child: const HomePage(),
      ),
    );
  }
}
