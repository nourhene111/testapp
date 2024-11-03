// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Cart icon action if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCartItem('Minimalist Chair', 'assets/images/chair1.jpg', 235.00, 2),
            _buildCartItem('Elegant White Chair', 'assets/images/chair2.jpg', 124.00, 1),
            _buildCartItem('Vintage Chair', 'assets/images/chaire 3.jpg', 89.00, 1),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  _buildSummaryRow('Selected Items', 235.00),
                  _buildSummaryRow('Shipping Fee', 30.00),
                  Divider(),
                  _buildSummaryRow('Subtotal', 265.00, isTotal: true),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Checkout action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Center(child: Text('Checkout', style: TextStyle(fontSize: 18))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String imagePath, double price, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('\$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.red)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  // Decrease quantity
                },
              ),
              Text('$quantity', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  // Increase quantity
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }
}
