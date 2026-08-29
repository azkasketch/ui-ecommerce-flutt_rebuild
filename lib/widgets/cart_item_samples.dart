import 'package:flutter/material.dart';

import '../theme.dart';
import 'items_widget.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  final quantities = [1, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        final product = products[index];
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
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(product.icon, color: ink.withValues(alpha: .75), size: 38),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: const TextStyle(color: muted, fontSize: 10),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.price,
                      style: const TextStyle(
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
                    onPressed: () {},
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
                        () => setState(() {
                          if (quantities[index] > 1) quantities[index]--;
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${quantities[index]}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      _quantityButton(
                        Icons.add_rounded,
                        () => setState(() => quantities[index]++),
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
