import 'package:flutter/material.dart';

import '../pages/detail_page.dart';
import '../theme.dart';

class Product {
  final String name;
  final String category;
  final String price;
  final String oldPrice;
  final Color color;
  final IconData icon;
  final String tag;

  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.color,
    required this.icon,
    required this.tag,
  });
}

const products = [
  Product(
    name: 'Sculpted Everyday Tote',
    category: 'Atelier No. 8',
    price: '\$84',
    oldPrice: '\$110',
    color: cream,
    icon: Icons.shopping_bag_rounded,
    tag: 'BESTSELLER',
  ),
  Product(
    name: 'Cloud Knit Set',
    category: 'Onda Studio',
    price: '\$68',
    oldPrice: '\$92',
    color: lavender,
    icon: Icons.checkroom_rounded,
    tag: 'NEW IN',
  ),
  Product(
    name: 'Daily Ritual Set',
    category: 'Hush Botanics',
    price: '\$42',
    oldPrice: '\$56',
    color: mint,
    icon: Icons.spa_rounded,
    tag: '-20%',
  ),
  Product(
    name: 'Arc Wireless Headphones',
    category: 'Morrow Audio',
    price: '\$129',
    oldPrice: '\$160',
    color: Color(0xFFF2B5D4),
    icon: Icons.headphones_rounded,
    tag: 'TRENDING',
  ),
];

class Itemswidget extends StatelessWidget {
  const Itemswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
        childAspectRatio: .67,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: product),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: surfaceElevated),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: product.color,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Icon(
                          product.icon,
                          size: 75,
                          color: ink.withValues(alpha: .72),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: ink.withValues(alpha: .88),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            product.tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 4,
                        right: 3,
                        child: Icon(
                          Icons.favorite_border_rounded,
                          size: 19,
                          color: ink,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.category,
                  style: const TextStyle(color: muted, fontSize: 11),
                ),
                const SizedBox(height: 3),
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      product.price,
                      style: const TextStyle(
                        color: coral,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      product.oldPrice,
                      style: const TextStyle(
                        color: muted,
                        fontSize: 11,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: coral,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 19,
                        color: ink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
