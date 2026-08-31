import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text(
                  'Your bag',
                  style: GoogleFonts.instrumentSerif(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -.8,
                    color: Colors.white,
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
                  child: Text(
                    '3 items',
                    style: GoogleFonts.instrumentSans(
                      color: muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
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
        boxShadow: const [
          BoxShadow(
            color: softShadow,
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
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
          Expanded(
            child: Text(
              'Have a promo code?',
              style: GoogleFonts.instrumentSans(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
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
        border: Border.all(color: divider),
        boxShadow: const [
          BoxShadow(
            color: softShadow,
            blurRadius: 22,
            offset: Offset(0, 14),
          ),
        ],
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
              child: Text(
                'Checkout  →',
                style: GoogleFonts.instrumentSans(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
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
          style: GoogleFonts.instrumentSans(
            color: large ? Colors.white : muted,
            fontWeight: large ? FontWeight.w800 : FontWeight.w500,
            fontSize: large ? 17 : 13,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.instrumentSans(
            color: valueColor,
            fontWeight: FontWeight.w800,
            fontSize: large ? 19 : 13,
          ),
        ),
      ],
    );
  }
}
