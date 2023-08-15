import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagerwithapi/ui/screens/splash_screen.dart';
import 'package:taskmanagerwithapi/ui/state_manager/login_controller.dart';

class TaskManagerApp extends StatelessWidget {
  static GlobalKey globalKey = GlobalKey();
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: TaskManagerApp.globalKey,
      debugShowCheckedModeBanner: false,
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
      initialBinding: ControllerBindings(),
      home: const SplashScreen(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
