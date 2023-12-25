import 'package:admin_app/Api_codes.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this line
  late AuthenticationService authService; // Remove the initialization here

  @override
  void initState() {
    super.initState();
    authService = AuthenticationService(context); // Initialize authService in initState
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF16355C), Colors.grey[100]!], // Set gradient colors
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        'Login to continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your mobile number',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2, // Adjust the border width
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    // Mobile number validation using a regular expression
                    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(value)) {
                      return 'Invalid mobile number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black38,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          // Use the actual user ID and password entered by the user
                          await authService.login(
                            mobileNumberController.text,
                            passwordController.text,
                          );

                          // If login is successful, navigate to the HomeScreen
                          // Navigator.pushNamed(context, 'HomeScreen');
                        } catch (e) {
                          print('Error during login: $e');
                          // Handle login failure (show an error message, etc.)
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('PROCEED', style: TextStyle(fontSize: 15, color: Color(0xFF16355C))),
                        SizedBox(width: 40),
                        Icon(
                          color: Color(0xFF25355C),
                          Icons.arrow_forward_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 225,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'ForgotPasswordScreen');
                    }, child: Text('forgot password?', style: TextStyle(fontSize: 15, ),)),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'PhoneVerification');
                    }, child: Text('create account', style: TextStyle(fontSize: 15, ),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateForm(BuildContext context) {
    return Form.of(context).validate();
  }
}
