import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cart_manager.dart';
import '../order_manager.dart';
import '../theme.dart';
import '../widgets/cart_item_samples.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _checkoutDone = false;

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

  void _refresh() {
    setState(() {
      if (CartManager.instance.items.isNotEmpty) {
        _checkoutDone = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartManager.instance;
    final itemCount = cart.itemCount;
    final subtotal = cart.subtotal;
    final shipping = subtotal > 0 ? 0.0 : 0.0;

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
                    '$itemCount ${itemCount == 1 ? 'item' : 'items'}',
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
                _summary(subtotal, shipping),
                if (_checkoutDone) ...[
                  const SizedBox(height: 16),
                  _checkoutNotice(),
                ],
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

  Widget _summary(double subtotal, double shipping) {
    final total = subtotal + shipping;

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
          _line('Subtotal', _currency(subtotal)),
          const SizedBox(height: 11),
          _line('Shipping', shipping == 0 ? 'Free' : _currency(shipping), valueColor: mint),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: surfaceElevated, height: 1),
          ),
          _line('Total', _currency(total), large: true),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 51,
            child: FilledButton(
              onPressed: () {
                if (CartManager.instance.items.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Your bag is empty. Add something first.')),
                  );
                  return;
                }

                _showPaymentSheet(context);
              },
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

  Widget _checkoutNotice() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: mint.withValues(alpha: .12),
        border: Border.all(color: mint.withValues(alpha: .3)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: mint),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Payment successful. Your order is now in Orders.',
              style: GoogleFonts.instrumentSans(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPaymentSheet(BuildContext context) async {
    String selected = 'E-Wallet';
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: surfaceElevated,
              title: Text(
                'Choose payment',
                style: GoogleFonts.instrumentSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _paymentOption('E-Wallet', selected, (value) => setState(() => selected = value)),
                  _paymentOption('Credit Card', selected, (value) => setState(() => selected = value)),
                  _paymentOption('Bank Transfer', selected, (value) => setState(() => selected = value)),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(dialogContext, selected),
                  style: FilledButton.styleFrom(backgroundColor: coral, foregroundColor: ink),
                  child: const Text('Pay now'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result == null) return;

    final items = List<CartItem>.from(CartManager.instance.items);
    OrderManager.instance.addFromCart(items, paymentMethod: result);
    CartManager.instance.clear();
    setState(() => _checkoutDone = true);

    if (!mounted) return;
    Navigator.pushNamed(context, 'OrdersPage');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment successful via $result.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  RadioListTile<String> _paymentOption(
    String value,
    String selected, 
    ValueChanged<String> onChanged,
  ) {
    return RadioListTile<String>(
      value: value,
      groupValue: selected,
      onChanged: (newValue) => onChanged(newValue ?? value),
      activeColor: coral,
      title: Text(
        value,
        style: GoogleFonts.instrumentSans(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _currency(double value) => '\$${value.toStringAsFixed(0)}';

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
