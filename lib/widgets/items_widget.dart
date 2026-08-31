import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cart_manager.dart';
import '../models/product.dart';
import '../pages/detail_page.dart';
import '../theme.dart';

const products = [
  Product(
    name: 'Sculpted Everyday Tote',
    category: 'Atelier No. 8',
    price: '\$84',
    oldPrice: '\$110',
    color: cream,
    icon: Icons.shopping_bag_rounded,
    tag: 'BESTSELLER',
    imageUrl:
        'https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=900&q=80',
  ),
  Product(
    name: 'Cloud Knit Set',
    category: 'Onda Studio',
    price: '\$68',
    oldPrice: '\$92',
    color: lavender,
    icon: Icons.checkroom_rounded,
    tag: 'NEW IN',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1755534537453-d1e5670c1f18?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2xvdWQlMjBrbml0JTIwc2V0fGVufDB8fDB8fHww',
  ),
  Product(
    name: 'Daily Ritual Set',
    category: 'Hush Botanics',
    price: '\$42',
    oldPrice: '\$56',
    color: mint,
    icon: Icons.spa_rounded,
    tag: '-20%',
    imageUrl:
        'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?auto=format&fit=crop&w=900&q=80',
  ),
  Product(
    name: 'Arc Wireless Headphones',
    category: 'Morrow Audio',
    price: '\$129',
    oldPrice: '\$160',
    color: Color(0xFFF2B5D4),
    icon: Icons.headphones_rounded,
    tag: 'TRENDING',
    imageUrl:
        'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&w=900&q=80',
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
        return Material(
          color: surface,
          borderRadius: BorderRadius.circular(23),
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
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
                boxShadow: const [
                  BoxShadow(
                    color: softShadow,
                    blurRadius: 18,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.network(
                            product.imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: product.color,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(strokeWidth: 2),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: product.color,
                                alignment: Alignment.center,
                                child: Icon(
                                  product.icon,
                                  size: 75,
                                  color: ink.withValues(alpha: .72),
                                ),
                              );
                            },
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
                              style: GoogleFonts.instrumentSans(
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
                    style: GoogleFonts.instrumentSans(
                      color: muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.instrumentSerif(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        product.price,
                        style: GoogleFonts.instrumentSans(
                          color: coral,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        product.oldPrice,
                        style: GoogleFonts.instrumentSans(
                          color: muted,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          CartManager.instance.addProduct(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to bag'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(9),
                        child: Container(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
