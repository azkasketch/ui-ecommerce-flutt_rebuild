import 'package:flutter/material.dart';
// import 'package:ui_ecommerce/pages/account_page.dart';
// import 'package:ui_ecommerce/pages/cart_page.dart';
// import 'package:ui_ecommerce/widgets/CategoriesWidget.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:ui_ecommerce/widgets/HomeAppBar.dart';

class Itemswidget extends StatelessWidget {
  Itemswidget({super.key});
  
  final List<String> myProductName = [
    'Outfit',
    'Makanan',
    'Skincare',
    'Eletronik',
  ];


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < myProductName.length; i++)
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        '-58%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'ItemsPage');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/items/${i + 1}.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        myProductName[i],
                        style: const TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Write description Product',
                        style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$65.00',
                            style: TextStyle(
                              color: Color(0xFF4C53A5),
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            size: 20.0,
                            color: Color(0xFF4C53A5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}