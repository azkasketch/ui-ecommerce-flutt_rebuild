import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../order_manager.dart';
import '../theme.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = OrderManager.instance.orders;

    return Scaffold(
      backgroundColor: ink,
      appBar: AppBar(
        backgroundColor: ink,
        title: Text(
          'Orders',
          style: GoogleFonts.instrumentSerif(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -.8,
          ),
        ),
      ),
      body: SafeArea(
        child: orders.isEmpty
            ? _emptyState()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                itemCount: orders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: surface,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: surfaceElevated),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              order.orderNumber,
                              style: GoogleFonts.instrumentSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                color: mint.withValues(alpha: .12),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'Paid',
                                style: GoogleFonts.instrumentSans(
                                  color: mint,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${order.summary} · ${_currency(order.total)}',
                          style: GoogleFonts.instrumentSans(
                            color: muted,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Paid with ${order.paymentMethod}',
                          style: GoogleFonts.instrumentSans(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _date(order.placedAt),
                          style: GoogleFonts.instrumentSans(
                            color: muted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Icon(Icons.shopping_bag_outlined, size: 42, color: coral),
            ),
            const SizedBox(height: 18),
            Text(
              'No orders yet',
              style: GoogleFonts.instrumentSerif(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your checked-out items will appear here.',
              textAlign: TextAlign.center,
              style: GoogleFonts.instrumentSans(
                color: muted,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _currency(double value) => '\$${value.toStringAsFixed(0)}';

  String _date(DateTime date) {
    final month = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][date.month - 1];
    return 'Placed ${date.day} $month ${date.year}';
  }
}
