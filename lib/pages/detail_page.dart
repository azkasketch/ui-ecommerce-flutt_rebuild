import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cart_manager.dart';
import '../models/product.dart';
import '../theme.dart';

const _fallbackProduct = Product(
  name: 'Sculpted Everyday Tote',
  category: 'Atelier No. 8',
  price: '\$84',
  oldPrice: '\$110',
  color: cream,
  icon: Icons.shopping_bag_rounded,
  tag: 'BESTSELLER',
  imageUrl:
      'https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=900&q=80',
);

class ProductDetailPage extends StatefulWidget {
  final Product? product;

  const ProductDetailPage({super.key, this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _selectedSize = 1;
  bool _saved = false;

  Product get product => widget.product ?? _fallbackProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: ink,
              leading: _roundButton(
                icon: Icons.arrow_back_rounded,
                onTap: () => Navigator.pop(context),
              ),
              actions: [
                _roundButton(
                  icon: _saved
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: _saved ? coral : Colors.white,
                  onTap: () => setState(() => _saved = !_saved),
                ),
                const SizedBox(width: 12),
              ],
            ),
            SliverToBoxAdapter(child: _productVisual()),
            SliverToBoxAdapter(child: _details()),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 10, 20, 16),
        child: SizedBox(
          height: 54,
          child: FilledButton(
            onPressed: () {
              CartManager.instance.addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to your bag'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: coral,
              foregroundColor: ink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Add to bag',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productVisual() {
    return Container(
      height: 350,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -22,
            top: -24,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .27),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
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
                  child: Icon(product.icon, size: 170, color: ink.withValues(alpha: .78)),
                );
              },
            ),
          ),
          Positioned(
            left: 18,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              decoration: BoxDecoration(
                color: ink.withValues(alpha: .88),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                product.tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _details() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.category,
            style: GoogleFonts.instrumentSans(
              color: mint,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            product.name,
            style: GoogleFonts.instrumentSerif(
              fontSize: 31,
              height: 1.1,
              fontWeight: FontWeight.w700,
              letterSpacing: -.7,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Text(
                product.price,
                style: GoogleFonts.instrumentSans(
                  color: coral,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 9),
              Text(
                product.oldPrice,
                style: GoogleFonts.instrumentSans(
                  color: muted,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star_rounded, color: cream, size: 19),
              const SizedBox(width: 3),
              Text(
                '4.9  ·  86 reviews',
                style: GoogleFonts.instrumentSans(
                  color: muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            'A considered essential for everyday rituals. Made to move with you, with soft textures and thoughtful details that feel good from the first wear.',
            style: GoogleFonts.instrumentSans(
              color: muted,
              height: 1.5,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Select size',
            style: GoogleFonts.instrumentSans(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 11),
          Row(
            children: List.generate(4, (index) {
              final selected = index == _selectedSize;
              return Padding(
                padding: const EdgeInsets.only(right: 9),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedSize = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: 52,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? coral : surface,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: selected ? coral : surfaceElevated,
                      ),
                    ),
                    child: Text(
                      ['XS', 'S', 'M', 'L'][index],
                      style: GoogleFonts.instrumentSans(
                        color: selected ? ink : Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
    Color color = Colors.white,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: color),
    );
  }
}
