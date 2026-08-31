import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cart_manager.dart';
import '../theme.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  @override
  void initState() {
    super.initState();
    CartManager.instance.addListener(_refresh);
  }

  @override
  void dispose() {
    CartManager.instance.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = CartManager.instance.items;
    if (items.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: surfaceElevated),
        ),
        child: Text(
          'Your bag is empty — add something delightful.',
          style: GoogleFonts.instrumentSans(
            color: muted,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Column(
      children: List.generate(items.length, (index) {
        final cartItem = items[index];
        final product = cartItem.product;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: surfaceElevated),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product.imageUrl,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 76,
                      height: 76,
                      color: product.color,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 76,
                      height: 76,
                      color: product.color,
                      alignment: Alignment.center,
                      child: Icon(product.icon, color: ink.withValues(alpha: .75), size: 38),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: GoogleFonts.instrumentSans(
                        color: muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.instrumentSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.price,
                      style: GoogleFonts.instrumentSans(
                        color: coral,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => CartManager.instance.removeProduct(product),
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: muted,
                      size: 19,
                    ),
                  ),
                  Row(
                    children: [
                      _quantityButton(
                        Icons.remove_rounded,
                        () => CartManager.instance.updateQuantity(
                          product,
                          cartItem.quantity - 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${cartItem.quantity}',
                          style: GoogleFonts.instrumentSans(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _quantityButton(
                        Icons.add_rounded,
                        () => CartManager.instance.updateQuantity(
                          product,
                          cartItem.quantity + 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: surfaceElevated,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
