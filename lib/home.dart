import 'package:flutter/material.dart';
import 'package:takeoutapp/credits.dart';
import 'package:takeoutapp/orders.dart';
import 'package:takeoutapp/profile.dart';
import 'package:takeoutapp/search.dart';
import 'package:takeoutapp/tools/CategoryChip.dart';
// import 'package:';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final _selectedIndex = 0;
  final _currentIndex = ValueNotifier<int>(0);

  final List<Widget> _screens = [
    const Home(), // Replace with your actual home screen
    const Orders(), // Replace with your star screen
    const Credits(), // Replace with your like screen
    const Profile(), // Replace with your message screen
    // Replace with your person screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Delivering to → Yo ▼', style: TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {},
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
              label: Text('\$5.00', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by restaurant or entrée',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Discover',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CategoryChip(label: 'Nearby', isSelected: true),
            //     CategoryChip(label: 'Trivia'),
            //     CategoryChip(
            //       label: 'Express',
            //     ),
            //     CategoryChip(label: 'Asian'),
            //   ],
            // ),.
            const CategoryChipsRow(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  RestaurantCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.jJI3bTJ-diLfKDHb9-vwmwHaE8?rs=1&pid=ImgDetMain', // Replace with actual image URL
                    name: 'Milkflower',
                    cuisine: 'Italian • Pizza',
                    deliveryTime: '12-15 min',
                    deliveryFee: '\$1.99 Delivery',
                    rating: '☆4.7',
                  ),
                  RestaurantCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=3840&h=2559&rs=1&pid=ImgDetMain', // Replace with actual image URL
                    name: 'Roberta\'s',
                    cuisine: 'Italian • Pizza',
                    deliveryTime: '15-20 min',
                    deliveryFee: '\$1.99 Delivery',
                    rating: '☆4.7',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.red
          // color: Colors.transparent,
          // image: DecorationImage(
          //   image: AssetImage('path/to/your/image.png'),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.red,
          selectedItemColor: Colors.red, // Customize selected item color
          unselectedItemColor: Colors.grey, // Customize unselected item color
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
          
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
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
                  // currentIndex: _selectedIndex,
        
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
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {},
      selectedColor: Colors.red,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String cuisine;
  final String deliveryTime;
  final String deliveryFee;
  final String rating;

  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.cuisine,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(cuisine),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('$deliveryTime • $deliveryFee • $rating'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
