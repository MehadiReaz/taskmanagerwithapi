import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.6),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              fillColor: Colors.white,
              border: OutlineInputBorder(borderSide: BorderSide.none))),
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
