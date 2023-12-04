
import 'package:admin_app/Home_Screen/home_screeen.dart';
import 'package:admin_app/forgot_password_screens/ForgotPassword_screen.dart';
import 'package:admin_app/forgot_password_screens/NewPassword_screen.dart';
import 'package:admin_app/forgot_password_screens/ResetPass_verification_Screen.dart';
import 'package:admin_app/login_signup_screens/login_screen.dart';
import 'package:admin_app/login_signup_screens/phone.dart';
import 'package:admin_app/login_signup_screens/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      initialRoute: 'LoginScreen', // Set the initial route to the login screen
      routes: {
        'LoginScreen': (context) => LoginScreen(), // Define the login screen route
        'PhoneVerification': (context) => MyPhone(), // Define the login screen route
        'OtpVerification': (context) => MyVerify(), // Define the login screen route
        'ForgotPasswordScreen': (context) => ForgotPasswordScreen(), // Define the login screen route
        'RecheckVerificationScreen': (context) => OTPVerificationScreen(), // Define the login screen route
        'NewPasswordScreen': (context) => NewPasswordScreen(), // Define the login screen route
        'HomeScreen': (context) => HomeScreen(), // Define the login screen route

        // Add more routes as needed
      },
    ),
  );
}
