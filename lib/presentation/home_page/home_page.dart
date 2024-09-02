import 'package:connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
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
                    Column(
                      children: [
                        const Icon(
                          Icons.wifi_off,
                          color: Colors.red,
                          size: 110,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset('assets/no_connection.png'),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Sem acesso à internet.',
                          style: GoogleFonts.raleway(
                            color: Colors.red,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  if (state == ConnectionStatus.connected)
                    Column(
                      children: [
                        const Icon(
                          Icons.wifi,
                          color: Color.fromRGBO(102, 196, 129, 1),
                          size: 110,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset('assets/connection.png'),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Conectado à internet.',
                          style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(134, 224, 160, 1),
                            fontSize: 26,
                          ),
                        ),
                      ],
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
