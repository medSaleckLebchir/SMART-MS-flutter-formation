import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/config.dart';
import 'package:flutter_with_firebase/screens/forgot_password_screen.dart';
import 'package:flutter_with_firebase/widget/my_button.dart';
import 'package:flutter_with_firebase/widget/my_text_filed.dart';
import 'package:get/get.dart';

import '../app_constants.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import 'main_screen.dart';
import 'sign_up_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: AppBar().preferredSize.height * 2),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Image.asset(
                    AppConstants.appLogo,
                    width: fullWidth(context) * 0.22,
                  ),
                ),
                SizedBox(height: fullHeight(context) * 0.06),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Login to your minifurs account"),
                SizedBox(height: fullHeight(context) * 0.04),
                MyTextFiled(
                  hint: 'Enter Email Address',
                  controller: _authController.emailController,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                MyTextFiled(
                  hint: 'Password',
                  hasIcon: true,
                  controller: _authController.passwordController,
                ),
                SizedBox(height: fullHeight(context) * 0.01),
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                        onTap: () {
                          Get.to(ForgotPasswordScreen());
                        },
                        child: const Text("Forgot Password?"))),
                SizedBox(height: fullHeight(context) * 0.04),
                Obx(() => _authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _authController.setIsLoading(true);
                            var loginResult = await _firebaseService.login(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                            if (loginResult == true) {
                              _authController.setIsLoading(false);
                              Get.to(MainScreen());
                            } else {
                              _authController.setIsLoading(false);
                              showSnackbarError('Login failed !');
                            }
                          }
                        },
                        title: 'Log In')),
                SizedBox(height: fullHeight(context) * 0.03),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Create Account Here',
                              style: TextStyle(
                                  color: AppConstants.secondColor,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
