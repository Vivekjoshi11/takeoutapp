import 'package:flutter/material.dart';

// class OrderViewScreen extends StatelessWidget {
//   final String title;
//   final String date;
//   final int items;
//   final double price;
//   final bool earned;
//   final double earnings;
//   final int points;

//   const OrderViewScreen({
//     super.key,
//     required this.title,
//     required this.date,
//     required this.items,
//     required this.price,
//     this.earned = false,
//     this.earnings = 0,
//     this.points = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               date,
//               style: const TextStyle(color: Colors.grey, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               '$items Items',
//               style: const TextStyle(color: Colors.grey, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               '\$$price',
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             if (earned) ...[
//               const SizedBox(height: 8),
//               Text(
//                 'Earnings: \$$earnings',
//                 style: const TextStyle(color: Colors.grey, fontSize: 16),
//               ),
//               Text(
//                 'Points: $points',
//                 style: const TextStyle(color: Colors.grey, fontSize: 16),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


class OrderViewScreen extends StatefulWidget {
  final String title;
  final String date;
  final int items;
  final double price;
  final bool earned;
  final double earnings;
  final int points;

  const OrderViewScreen({
    super.key,
    required this.title,
    required this.date,
    required this.items,
    required this.price,
    this.earned = false,
    this.earnings = 0,
    this.points = 0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OrderViewScreenState createState() => _OrderViewScreenState();
}

class _OrderViewScreenState extends State<OrderViewScreen> {
  String _selectedItemType = 'Item Type 1';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
        // title: Text(widget.title),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
             
              Text(widget.title,
             style: const TextStyle(fontSize: 30),),
           
             
            Text(
              widget.date,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.items} Items',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${widget.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 32),
            const Text(
              'Choose an item type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            RadioListTile<String>(
              title: const Text('Item Type 1'),
              value: 'Item Type 1',
              groupValue: _selectedItemType,
              onChanged: (value) {
                setState(() {
                  _selectedItemType = value!;
                });
              },
              secondary: const Text('\$4.99'),
            ),
            RadioListTile<String>(
              title: const Text('Item Type 2'),
              value: 'Item Type 2',
              groupValue: _selectedItemType,
              onChanged: (value) {
                setState(() {
                  _selectedItemType = value!;
                });
              },
              secondary: const Text('\$4.99'),
            ),
            const ExpansionTile(
              title: Text('Choice of substitution'),
              children: [
                ListTile(
                  title: Text('Substitution 1'),
                ),
                ListTile(
                  title: Text('Substitution 2'),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Add special instructions'),
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter special instructions',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) _quantity--;
                        });
                      },
                    ),
                    Text('$_quantity', style: const TextStyle(fontSize: 18)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(220, 50),
                    // shape: const RoundedRectangleBorder( borderRadius: BorderRadius.all(),),
                    shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  ),
),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Handle add to cart action
                  },
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}