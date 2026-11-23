import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../order_manager.dart';
import '../theme.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key, this.orders});

  final List<OrderRecord>? orders;

  @override
  Widget build(BuildContext context) {
    final visibleOrders = orders ?? OrderManager.instance.orders;

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
        child: visibleOrders.isEmpty
            ? _emptyState()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                itemCount: visibleOrders.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final order = visibleOrders[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderDetailPage(order: order),
                      ),
                    ),
                    child: Container(
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
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
                          Row(
                            children: [
                              const Icon(
                                Icons.chevron_right_rounded,
                                color: muted,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _date(order.placedAt),
                                style: GoogleFonts.instrumentSans(
                                  color: muted,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 42,
                color: coral,
              ),
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
              style: GoogleFonts.instrumentSans(color: muted, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  String _currency(double value) => '\$${value.toStringAsFixed(0)}';

  String _date(DateTime date) {
    final month = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][date.month - 1];
    return 'Placed ${date.day} $month ${date.year}';
  }
}

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, required this.order});

  final OrderRecord order;

  @override
  Widget build(BuildContext context) {
    final subtotal = order.items.fold(
      0.0,
      (sum, item) => sum + _parsePrice(item.product.price) * item.quantity,
    );

    return Scaffold(
      backgroundColor: ink,
      appBar: AppBar(
        backgroundColor: ink,
        title: Text(
          'Order details',
          style: GoogleFonts.instrumentSerif(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -.8,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            _sectionCard(
              title: 'Overview',
              child: Column(
                children: [
                  _infoRow('Order', order.orderNumber),
                  _infoRow('Date', _date(order.placedAt)),
                  _infoRow('Payment', order.paymentMethod),
                  _infoRow('Status', 'Paid', valueColor: mint),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _sectionCard(
              title: 'Items',
              child: Column(
                children: order.items.map((item) {
                  final itemTotal =
                      _parsePrice(item.product.price) * item.quantity;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            item.product.imageUrl,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.instrumentSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${item.product.category} · Qty ${item.quantity}',
                                style: GoogleFonts.instrumentSans(
                                  color: muted,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _currency(itemTotal),
                          style: GoogleFonts.instrumentSans(
                            color: coral,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            _sectionCard(
              title: 'Payment',
              child: Column(
                children: [
                  _infoRow('Subtotal', _currency(subtotal)),
                  _infoRow('Shipping', 'Free', valueColor: mint),
                  _infoRow('Method', order.paymentMethod),
                  const Divider(color: surfaceElevated, height: 20),
                  _infoRow(
                    'Total',
                    _currency(order.total),
                    valueColor: coral,
                    bold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _sectionCard(
              title: 'Delivery',
              child: Column(
                children: [
                  _infoRow('ETA', '2-4 business days'),
                  _infoRow('Courier', 'Bakul Express'),
                  _infoRow('Notes', 'Packed and ready for dispatch'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
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
          Text(
            title,
            style: GoogleFonts.instrumentSans(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(
    String label,
    String value, {
    Color valueColor = Colors.white,
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.instrumentSans(
                color: muted,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.instrumentSans(
              color: valueColor,
              fontWeight: bold ? FontWeight.w800 : FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _currency(double value) => '\$${value.toStringAsFixed(0)}';

  String _date(DateTime date) {
    final month = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][date.month - 1];
    return '${date.day} $month ${date.year}';
  }

  double _parsePrice(String priceText) {
    final sanitized = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(sanitized) ?? 0;
  }
}
