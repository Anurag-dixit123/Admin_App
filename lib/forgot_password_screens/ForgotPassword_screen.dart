import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ForgotPasswordScreen());
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countrycode = TextEditingController();
  var phone ="";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }
  Future<void> savePhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.teal.shade400, Colors.grey[100]!], // Set gradient colors
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/boy1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 280,
                    child: Text(
                      "Enter the mobile number associated with your account.",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    child: Text(
                      "We will send you a otp to reset your password.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value){
                      phone=value;
                    },
                    controller: phoneNumberController,
                    validator: validateMobileNumber,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                    ),
                    keyboardType: TextInputType.phone,
                    // You can set the controller for this TextFormField
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async{
                        // Validate phone number before sending the code
                        if (validateMobileNumber(phoneNumberController.text) == null) {
                          // Save phone number in shared preferences
                          await savePhoneNumber(phoneNumberController.text);

                          // Send verification code
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${countrycode.text + phone}',
                            verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {
                              // Navigate to the OTP verification screen
                              // and pass the verification ID
                              Navigator.pushNamed(context, 'RecheckVerificationScreen',
                                  arguments: verificationId);
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );
                        } else {
                          // Show an error message for invalid phone number
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter a valid phone number"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
