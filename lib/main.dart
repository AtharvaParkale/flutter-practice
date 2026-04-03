import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_practice/dependency_manager/init_dependencies.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/payment_screen.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/redo_undo_implementation/redo_undo_screen.dart';
import 'package:flutter_daily_practice/features/home/presentation/bloc/home_bloc.dart';

import 'features/demo_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<HomeBloc>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
