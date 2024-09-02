import 'package:connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.read<ConnectionCheckerCubit>().checkConnectivity();
          },
          child: BlocSelector<ConnectionCheckerCubit, ConnectionCheckerState, ConnectionStatus>(
            selector: (state) => state.maybeWhen(
              status: (status) => status,
              orElse: () => ConnectionStatus.disconnected,
            ),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state == ConnectionStatus.disconnected)
                    const Text(
                      'Desconectado!!!!',
                      style: TextStyle(color: Colors.red),
                    ),
                  if (state == ConnectionStatus.connected)
                    const Text(
                      'CONECTADO',
                      style: TextStyle(color: Colors.green),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
