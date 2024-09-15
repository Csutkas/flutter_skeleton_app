import 'package:flutter/material.dart';
import 'package:flutter_app/global_providers/auth_provider.dart';
import 'package:flutter_app/global_providers/theme_provider.dart';

import 'package:flutter_app/navigator/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Global AuthProvider
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()), // Global ThemeProvider
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp.router(
            theme: themeProvider.theme, // Apply global theme
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
