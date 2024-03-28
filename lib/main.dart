import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/bloc/ramadan_bloc.dart';

import 'data/ramadan_data_provider.dart';
import 'data/ramadan_repository.dart';
import 'ramadan_screen.dart';

void main() {
  runApp(const RamadanApp());
}

class RamadanApp extends StatelessWidget {
  const RamadanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          RamadanRepository(ramadanDataProvider: RamadanDataProvider()),
      child: BlocProvider(
        create: (context) => RamadanBloc(
          context.read<RamadanRepository>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ramadan App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RamadanScreen(),
        ),
      ),
    );
  }
}
