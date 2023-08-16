import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taskmanagerwithapi/ui/widgets/background_screen.dart';
import '../../state_manager/signup_controller.dart';
import '../../utils/assets_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SvgPicture.asset(
                AssetsUtils.backgroundSvg,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
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
                          validator: (value) {
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
                              return 'Enter First Name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter Last Name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter Mobile No.';
                            }
                            return null;
                          },
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Mobile',
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
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<SignupController>(
                            builder: (signupController) {
                          return SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible:
                                  signupController.signupInProgress == false,
                              replacement: const Center(
                                  child: CircularProgressIndicator()),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    signupController
                                        .userSignup(
                                            _emailController.text.trim(),
                                            _firstNameController.text.trim(),
                                            _lastNameController.text.trim(),
                                            _mobileController.text.trim(),
                                            _passwordController.text.trim())
                                        .then((value) {
                                      if (value == true) {
                                        _emailController.clear();
                                        _firstNameController.clear();
                                        _lastNameController.clear();
                                        _mobileController.clear();
                                        _passwordController.clear();
                                        Get.snackbar('Success',
                                            'Account created successfully');
                                      } else {
                                        Get.snackbar('Failed!',
                                            'Account creatation failed');
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Have Account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Sign in'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
