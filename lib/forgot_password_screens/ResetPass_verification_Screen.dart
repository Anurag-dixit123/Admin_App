// import 'package:flutter/material.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
//
// void main() {
//   runApp(OTPVerificationScreen());
// }
//
// class OTPVerificationScreen extends StatefulWidget {
//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }
//
// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   TextEditingController otpController = TextEditingController();
//   String errorMessage = '';
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomCenter,
//               colors: [Colors.teal.shade400, Colors.grey[100]!], // Set gradient colors
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   "OTP Verification",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(55),
//                   ),
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/boy1.jpg'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   width: 280,
//                   child: Text(
//                     "Enter the verification code we just sent to you on  your mobile number.",
//                     style: TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 PinInputTextField(
//                   pinLength: 6,
//                   controller: otpController,
//                   keyboardType: TextInputType.number,
//                   onChanged: (otp) {
//                     if (otp.length == 6) {
//                       // Handle OTP verification when the length is 6
//                     }
//                   },
//                   decoration: UnderlineDecoration(
//                     colorBuilder: FixedColorBuilder(
//                         Colors.red,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Text("if you didn't receive a code!"),
//                     TextButton(onPressed: (){
//
//                     }
//                         , child: Text('Resend', style: TextStyle(color: Colors.blue, fontSize: 15),))
//                   ],
//                 ),
//                 Text(
//                   errorMessage, // Display error message if present
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   width: 120,
//                   height: 45,
//                   child: ElevatedButton(
//                     onPressed: ()  {
//                       // Handle the "Verify" button tap here
//                       String otp = otpController.text;
//                       Navigator.pushNamed(context, 'NewPasswordScreen');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: Text("Verify", style: TextStyle(fontSize: 18)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() =>
      _OTPVerificationScreenState();
}

class _OTPVerificationScreenState
    extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final String verificationId =
    ModalRoute.of(context)?.settings.arguments as String;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.teal.shade400, Colors.grey[100]!],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Text(
                  "OTP Verification",
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
                    "Enter the verification code we just sent to you on your mobile number.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                PinInputTextField(
                  pinLength: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  onChanged: (otp) {
                    if (otp.length == 6) {
                      // Handle OTP verification when the length is 6
                      _verifyOTP(verificationId, otp);
                    }
                  },
                  decoration: UnderlineDecoration(
                    colorBuilder: FixedColorBuilder(
                      Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("if you didn't receive a code!"),
                    TextButton(
                      onPressed: () {
                        // Implement resend OTP logic here
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the "Verify" button tap here
                      String otp = otpController.text;
                      _verifyOTP(verificationId, otp);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Verify", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOTP(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Sign in with the phone credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // TODO: Navigate to the new password screen or handle the next steps
      Navigator.pushNamed(context, 'NewPasswordScreen');
    } catch (e) {
      setState(() {
        errorMessage = 'Invalid OTP. Please try again.';
      });
    }
  }
}
