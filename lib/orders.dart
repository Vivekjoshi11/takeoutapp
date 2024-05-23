import 'package:flutter/material.dart';
import 'package:takeoutapp/credits.dart';
import 'package:takeoutapp/home.dart';
import 'package:takeoutapp/profile.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _currentIndex = ValueNotifier<int>(0);

  final List<Widget> _screens = [
   const  Home(), // Replace with your actual home screen
    const Orders(), // Replace with your star screen
    const Credits(),  // Replace with your like screen
    const Profile(), // Replace with your message screen
     // Replace with your person screen
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Orders',),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: ListView(
        children: const [
          OrderCard(
            title: 'Katsuei',
            date: 'Saturday, Dec 21st',
            items: 3,
            price: 18.26,
            earned: true,
            earnings: 3.50,
            points: 79,
          ),
          OrderCard(
            title: 'Milkflower',
            date: 'Wednesday, Dec 21st',
            items: 2,
            price: 28.44,
          ),
          OrderCard(
            title: 'Joe\'s Pizza',
            date: 'Saturday, Nov 21st',
            items: 3,
            price: 18.26,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.blue,  // Customize selected item color
        unselectedItemColor: Colors.grey, // Customize unselected item color
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,
            color: Colors.blue,
            ),
            label: 'cart',
            
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_cart),
          //   label: 'Cart',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Bag',
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Bag',
          ),
            
        ],
         onTap: (index) {
            setState(() {
              _currentIndex.value = index;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _screens[index]),
            );
          },
        ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String title;
  final String date;
  final int items;
  final double price;
  final bool earned;
  final double earnings;
  final int points;

  const OrderCard({super.key, 
    required this.title,
    required this.date,
    required this.items,
    required this.price,
    this.earned = false,
    this.earnings = 0,
    this.points = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            '$items Items',
            style: const TextStyle(color: Colors.grey),
          ),
          if (earned)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.shopping_bag, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '\$$earnings',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$points Points',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}