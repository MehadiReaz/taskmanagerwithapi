import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_manager/reset_password_controller.dart';
import '../../widgets/background_screen.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email, otp;

  const ResetPasswordScreen({Key? key, required this.email, required this.otp})
      : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    Text(
                      'Set Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Minimum password should be 8 letters with numbers & symbols',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _confirmPasswordTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your confirm password';
                        } else if (value! != _passwordTEController.text) {
                          return 'Confirm password does n\'t match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<ResetPasswordController>(
                        builder: (resetPasswordController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible:
                              resetPasswordController.setPasswordInProgress ==
                                  false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              resetPasswordController
                                  .resetPassword(
                                widget.email,
                                widget.otp,
                                _passwordTEController.text.trim(),
                              )
                                  .then((value) {
                                if (value == true) {
                                  Get.offAll(() => LoginScreen());
                                } else {
                                  Get.snackbar('Failed!',
                                      'Reset password has been failed!');
                                }
                              });
                            },
                            child: const Text('Confirm'),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAll(() => LoginScreen());
                            },
                            child: const Text('Sign in')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
