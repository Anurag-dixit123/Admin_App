import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var phone="";


  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  // Simple phone number validation function
  bool validatePhoneNumber(String value) {
    return value.isNotEmpty && value.length == 10;
  }

  // Function to save phone number in shared preferences
  Future<void> savePhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF16355C), Colors.grey[100]!], // Set gradient colors
          ),
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/img1.png',
              //   width: 150,
              //   height: 150,
              // ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          controller: phoneNumberController,
                          onChanged: (value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      // Validate phone number before sending the code
                      if (validatePhoneNumber(phoneNumberController.text)) {

                        // Save phone number in shared preferences
                        await savePhoneNumber(phoneNumberController.text);

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countrycode.text + phoneNumberController.text}',
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            MyPhone.verify = verificationId;
                            Navigator.pushNamed(context, 'OtpVerification');
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
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}