import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import '../screens/ProfilePage.dart';
import '../screens/DetailPage.dart';
import '../models/item_model.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Minimal Chair', imagePath: 'assets/images/chair1.jpg', price: 250.00),
    Item(name: 'Elegant White Chair', imagePath: 'assets/images/chair2.jpg', price: 115.00),
    Item(name: 'Vintage Chair', imagePath: 'assets/images/chaire 3.jpg', price: 89.00),
  ];

  final Item bestSellingItem = Item(
    name: 'Minimal Chair',
    imagePath: 'assets/images/salle.jpg',
    price: 125.00,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the drawer
            },
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black), // Profile icon
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Go to cart page
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 80, color: Colors.black),
                  SizedBox(height: 10),
                  Text('William John Malik', style: TextStyle(fontSize: 16, color: Colors.black)),
                  Text('Aggressive Investor', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                // Add logout logic here
              },
            ),
            Divider(), // Divider between sections
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to Settings Page
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('E-Statement'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to E-Statement Page
              },
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Referral Code'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to Referral Code Page
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQs'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to FAQs Page
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Our Handbook'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to Our Handbook Page
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Community'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16), // Arrow icon
              onTap: () {
                // Navigate to Community Page
              },
            ),
            // Bottom Navigation Bar
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil', // Home
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil', // Profile
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages', // Messages
                ),
              ],
              currentIndex: 0, // You can manage this state with a state management solution
              onTap: (index) {
                // Handle navigation based on the index
                switch (index) {
                  case 0:
                    Navigator.pop(context); // Close the drawer
                    break;
                  case 1:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    break;
                  case 2:
                    // Navigate to Messages Page (implement the page if needed)
                    break;
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Explore Section
            Text('Explore', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
              ),
            ),
            SizedBox(height: 20),

            // Best Selling Section
            Text('Best Selling', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(item: bestSellingItem)),
                );
              },
              child: Container(
                height: 120,
                child: ItemCard(item: bestSellingItem, isCompact: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
