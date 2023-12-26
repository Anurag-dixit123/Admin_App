// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Container(
//         color: Colors.blue, // Set your desired background color
//         child: Center(
//           child: Text(
//             'Welcome to Home Screen!',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'sidebar_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('AddSpot')),
        backgroundColor: Colors.teal[500],
        // automaticallyImplyLeading: false, // Add this line to disable the back button
      ),
      drawer: Drawer(
        child: SidebarScreen(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                //Top Container Code
                Container(
                  color: Colors.yellow,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton( onPressed: (){
                        // Add the Functionality of Button Here
                        Navigator.pushNamed(context, 'BannerScreen');
                      },child:  Text(
                        'Banner',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),),
                      IconButton(
                        onPressed: () {
                          // Handle button press
                          Navigator.pushNamed(context, 'BannerScreen');
                          print('IconButton pressed!');
                        },
                        icon: Icon(Icons.arrow_forward), // Icon to be displayed
                      ),
                    ],
                  ),
                ),
                //Bottom Container Code
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey.shade300,
                        Colors.teal[500]!
                      ], // Set gradient colors
                    ),
                  ),
                  // color: Colors.red, // Brand container color
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 10 ',
                            style: TextStyle(color: Colors.white, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 0 ',
                            style: TextStyle(color: Colors.black, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Top Container Code
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton( onPressed: (){
                          // Add the Functionality of Button Here
                          Navigator.pushNamed(context, 'BrandScreen');
                        },child:  Text(
                          'Brand',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),),
                        IconButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, 'BrandScreen');
                            print('IconButton pressed!');
                          },
                          icon: Icon(Icons.arrow_forward), // Icon to be displayed
                        ),
                      ],
                    ),
                  ),
                ),
                //Bottom Container Code
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey.shade300,
                        Colors.teal[500]!
                      ], // Set gradient colors
                    ),
                  ),
                  // color: Colors.red, // Brand container color
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 10 ',
                            style: TextStyle(color: Colors.white, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 0 ',
                            style: TextStyle(color: Colors.black, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Top Container Code
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton( onPressed: (){
                        // Add the Functionality of Button Here
                        Navigator.pushNamed(context, 'CategoriesScreen');
                      },child:  Text(
                        'Categories',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),),
                      IconButton(
                        onPressed: () {
                          // Handle button press
                          Navigator.pushNamed(context, 'CategoriesScreen');
                          print('IconButton pressed!');
                        },
                        icon: Icon(Icons.arrow_forward), // Icon to be displayed
                      ),
                    ],
                  ),
                ),
                // Bottom Container Code
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey.shade300,
                        Colors.teal[500]!
                      ], // Set gradient colors
                    ),
                  ),
                  // color: Colors.red, // Brand container color
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 10 ',
                            style: TextStyle(color: Colors.white, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 0 ',
                            style: TextStyle(color: Colors.black, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Top Container Code
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton( onPressed: (){
                        // Add the Functionality of Button Here
                        Navigator.pushNamed(context, 'ProductScreen');
                      },child:  Text(
                        'Product',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),),
                      IconButton(
                        onPressed: () {
                          // Handle button press
                          Navigator.pushNamed(context, 'ProductScreen');
                          print('IconButton pressed!');
                        },
                        icon: Icon(Icons.arrow_forward), // Icon to be displayed
                      ),
                    ],
                  ),
                ),
                // Bottom Container Code
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey.shade300,
                        Colors.teal[500]!
                      ], // Set gradient colors
                    ),
                  ),
                  // color: Colors.red, // Brand container color
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 10 ',
                            style: TextStyle(color: Colors.white, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            ' 0 ',    
                            style: TextStyle(color: Colors.black, fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                           ElevatedButton(onPressed: (){
                             Navigator.pushNamed(context, 'GraphScreen');
                           }, child: Text('Abhi'))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
