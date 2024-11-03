import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final bool isCompact;

  ItemCard({required this.item, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCompact ? 150 : 200,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              item.imagePath,
              height: isCompact ? 100 : 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Overlay icons
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: const Color.fromARGB(255, 199, 3, 3)),
              onPressed: () {
                // Add favorite logic here
              },
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.add_circle_outline, color: const Color.fromARGB(255, 20, 19, 19)),
              onPressed: () {
                // Add to cart logic here
              },
            ),
          ),
          // Item details
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(color: const Color.fromARGB(255, 8, 8, 8), fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
