import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_practice/dependency_manager/init_dependencies.dart';
import 'package:flutter_daily_practice/features/deep_links/screens/app_root.dart';
import 'package:flutter_daily_practice/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_daily_practice/features/layout_practice/example_three.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    AppRoot(
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => serviceLocator<HomeBloc>())],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ExampleThree(),
    );
  }
}
