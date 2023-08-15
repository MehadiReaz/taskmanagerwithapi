import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taskmanagerwithapi/ui/screens/auth/signup_screen.dart';
import 'package:taskmanagerwithapi/ui/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taskmanagerwithapi/ui/state_manager/login_controller.dart';
import '../../utils/assets_utils.dart';
import '../../widgets/background_screen.dart';
import 'email_varification_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Center(
                          child: SvgPicture.asset(
                            AssetsUtils.logoSvg,
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          'Get Started With',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter Email Address';
                            }
                            return null;
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<LoginController>(builder: (loginController) {
                          return SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible: loginController.loginInProgress == false,
                              replacement:
                                  Center(child: CircularProgressIndicator()),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    loginController
                                        .userLogin(_emailController.text.trim(),
                                            _passwordController.text)
                                        .then((value) {
                                      if (value == true) {
                                        Get.offAll(() => BottomNavBar());
                                      } else {
                                        Get.snackbar(
                                            'Failed', 'Login Failed try again');
                                      }
                                    });
                                  },
                                  child: const Icon(
                                      CupertinoIcons.greaterthan_circle)),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => EmailVerificationScreen());
                            },
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont\'t have an Account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUpScreen());
                                },
                                child: const Text('SignUp'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
