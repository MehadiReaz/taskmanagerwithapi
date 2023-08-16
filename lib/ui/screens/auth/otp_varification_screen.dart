import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanagerwithapi/ui/state_manager/otp_varification_controller.dart';
import '../../widgets/background_screen.dart';
import 'login_screen.dart';
import 'reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      'PIN Verification',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'A 6 digits pin will sent to your email address',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP.';
                        } else if (value.length != 6) {
                          return 'OTP must be exactly 6 digits.';
                        }
                        return null;
                      },
                      controller: _otpTEController,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.red,
                        activeColor: Colors.white,
                        selectedColor: Colors.green,
                        selectedFillColor: Colors.white,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      cursorColor: Colors.green,
                      enablePinAutofill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<OTPVarificationController>(
                        builder: (otpVarificationController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: otpVarificationController
                                  .otpVerificationInProgress ==
                              false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                otpVarificationController
                                    .verifyOTP(widget.email,
                                        _otpTEController.text.trim())
                                    .then((value) {
                                  if (value == true) {
                                    Get.to(() => ResetPasswordScreen(
                                        email: widget.email,
                                        otp: _otpTEController.text.trim()));
                                  } else {
                                    Get.snackbar(
                                        'Failed!', 'OTP varificaton failed');
                                  }
                                });
                              }
                            },
                            child: const Text('Verify'),
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
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
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
