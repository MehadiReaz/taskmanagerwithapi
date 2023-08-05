import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerwithapi/data/model/auth_utility.dart';
import 'package:taskmanagerwithapi/ui/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taskmanagerwithapi/ui/utils/assets_utils.dart';

import '../../data/model/auth_utility.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToLogin();

    super.initState();
  }

  void navigateToLogin() async {
    final bool isUserLoggedIn = await AuthUtility.checkIfUserLoggedIn();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isUserLoggedIn ? BottomNavBar() : LoginScreen()),
          (router) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AssetsUtils.backgroundSvg),
          ),
          Center(
            child: SvgPicture.asset(AssetsUtils.logoSvg),
          )
        ],
      ),
    );
  }
}
