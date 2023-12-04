import 'package:flutter/material.dart';

void main() {
  runApp(NewPasswordScreen());
}

class NewPasswordScreen extends StatefulWidget {
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isPasswordVisible = false;

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
            padding: const EdgeInsets.only(top: 100, left: 12, right: 12 ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.only(right: 156.0),
                  child: Text('Enter New Password', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 8,),
                TextField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
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
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 140.0),
                  child: Text('Confirm New Password', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 8,),
                TextField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
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
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality to change password here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Orange color for the button
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black

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
