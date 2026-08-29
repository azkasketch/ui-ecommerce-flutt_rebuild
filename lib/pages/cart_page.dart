import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/cart_item_samples.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            child: Row(
              children: [
                const Text(
                  'Your bag',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.8,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '3 items',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const CartItemSamples(),
                const SizedBox(height: 10),
                _couponRow(),
                const SizedBox(height: 20),
                _summary(),
                const SizedBox(height: 105),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _couponRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: surfaceElevated),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: mint.withValues(alpha: .16),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(Icons.local_offer_outlined, color: mint, size: 18),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Text(
              'Have a promo code?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: muted),
        ],
      ),
    );
  }

  Widget _summary() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _line('Subtotal', '\$194'),
          const SizedBox(height: 11),
          _line('Shipping', 'Free', valueColor: mint),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: surfaceElevated, height: 1),
          ),
          _line('Total', '\$194', large: true),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 51,
            child: FilledButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout is ready when you are')),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: coral,
                foregroundColor: ink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Checkout  →',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(String label, String value,
      {Color valueColor = Colors.white, bool large = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: large ? Colors.white : muted,
            fontWeight: large ? FontWeight.w800 : FontWeight.w500,
            fontSize: large ? 17 : 13,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.w800,
            fontSize: large ? 19 : 13,
          ),
        ),
      ],
    );
  }
}
