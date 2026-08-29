import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<String> categories = [
      'Outfit',
      'Makanan',
      'Skincare',
      'Eletronik',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/${categories[i].toLowerCase()}.png',
                  width: 30.0,
                  height: 30.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  categories[i],
                  style: const TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ), 
          ),
        ],
      ),
    );
  }
}