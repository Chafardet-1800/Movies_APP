import 'package:flutter/material.dart';
import 'package:peliculas/provider/movies_provider.dart';

import 'package:peliculas/router/app_routes.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => MoviesProvider(), lazy: false, )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoutes,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGeneralRoute,
      theme: AppTheme.ligthTheme
    );
  }
}