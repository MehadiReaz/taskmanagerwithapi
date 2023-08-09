import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagerwithapi/data/model/auth_utility.dart';
import 'package:taskmanagerwithapi/data/model/login_model.dart';
import 'package:taskmanagerwithapi/data/model/network_response.dart';
import 'package:taskmanagerwithapi/data/services/network_caller.dart';
import 'package:taskmanagerwithapi/data/utils/urls.dart';
import 'package:taskmanagerwithapi/ui/screens/auth/signup_screen.dart';
import '../../utils/assets_utils.dart';
import '../../widgets/background_screen.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
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
  bool _loginInProgress = false;

  void userLogin() async {
    if (mounted) {
      setState(() {
        _loginInProgress = true;
      });
    }
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, <String, dynamic>{
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    });
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(loginModel);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const BottomNavBar()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Incrorrect Password')));
    }
    if (mounted) {
      setState(() {
        _loginInProgress = false;
      });
    }
  }

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
                        SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: _loginInProgress == false,
                            replacement:
                                Center(child: CircularProgressIndicator()),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  userLogin();
                                },
                                child: const Icon(
                                    CupertinoIcons.greaterthan_circle)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const EmailVerificationScreen()));
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const SignUpScreen()));
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
