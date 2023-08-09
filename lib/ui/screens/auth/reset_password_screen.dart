import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagerwithapi/ui/widgets/background_screen.dart';

import '../../utils/assets_utils.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key, required String email, required String otp});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              AssetsUtils.backgroundSvg,
              fit: BoxFit.cover,
            ),
          ),
          ScreenBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(34.0),
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
                          height: 50,
                        ),
                        Text(
                          'Set Password',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Minimum length password 8 character with Latter and number combination',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passController,
                          validator: (String? value) {
                            if ((value?.isEmpty ?? true) ||
                                value!.length <= 5) {
                              return 'Enter a password more than 6 letters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if ((value?.isEmpty ?? true) ||
                                value!.length <= 5 ||
                                _passController != _confirmPassController) {
                              return 'Password doesn\'t match';
                            }
                            return null;
                          },
                          controller: _confirmPassController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()),
                                    (route) => false);
                              },
                              child: const Text('Confirm')),
                        ),
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
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()),
                                        (route) => false);
                                  }
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
          ),
        ],
      ),
    );
  }
}
