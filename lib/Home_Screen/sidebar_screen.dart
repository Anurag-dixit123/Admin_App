import 'package:flutter/material.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  State<SidebarScreen> createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 224, 235),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            buildProfileCard(),
            buildActionRow("Home", Icons.home_outlined, () {
              // Handle tap for Favourites
            }),
            buildActionRow("Customer List", Icons.list_outlined, () {
              // Handle tap for Money
            }),
            buildActionRow("Orders Pending", Icons.pending_actions_outlined, () {
              // Handle tap for Your Profile
            }),
            buildActionRow("Orders Delivered", Icons.book_online_outlined, () {
              // Handle tap for Your Rating
            }),
            buildActionRow("Brands", Icons.branding_watermark_sharp, () {
              // Handle tap for Your Orders
            }),
            buildActionRow("Category", Icons.category_outlined, () {
              // Handle tap for Your Orders
            }),
            buildActionRow("Product", Icons.store_mall_directory_outlined, () {
              // Handle tap for Your Orders
            }),
            buildActionRow("Slidder", Icons.slideshow_outlined, () {
              // Handle tap for Your Orders
            }),
            buildActionRow("FAQ", Icons.details, () {
              // Handle tap for Feedback
            }),
            buildActionRow("Company Profile", Icons.person_search_outlined, () {
              // Handle tap for Settings
            }),
            SizedBox(height: 10),
            buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 400.0,
          height: 100.0,
          child: Row(
            children: [
              Container(
                width: 70.0,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/images/addspot1.jpg',
                    height: 60,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anurag Dixit',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'abc1234@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle tap for View Activity
                              },
                              child: Text(
                                'View activity',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionRow(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 400.0,
          height: 70.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin()));
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
