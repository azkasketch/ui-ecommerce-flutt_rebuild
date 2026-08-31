import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../order_manager.dart';
import '../theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    OrderManager.instance.addListener(_refresh);
  }

  @override
  void dispose() {
    OrderManager.instance.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final orders = OrderManager.instance.orders;
    final latestOrderCount = orders.isEmpty
        ? 0
        : orders.first.totalQuantity;

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
        children: [
          Row(
            children: [
              Text(
                'Profile',
                style: GoogleFonts.instrumentSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -.8,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _profileCard(),
          if (orders.isNotEmpty) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: surfaceElevated),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent orders',
                    style: GoogleFonts.instrumentSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...orders.take(2).map((order) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: mint,
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${order.summary} · ${_currency(order.total)}',
                              style: GoogleFonts.instrumentSans(
                                color: muted,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
          const SizedBox(height: 25),
          Text(
            'Your space',
            style: GoogleFonts.instrumentSerif(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          _settingItem(
            icon: Icons.shopping_bag_outlined,
            title: 'Orders',
            subtitle: latestOrderCount == 0
                ? 'Track and manage your purchases'
                : '$latestOrderCount item${latestOrderCount > 1 ? 's' : ''} in your latest order',
            onTap: () => _showMessage(
              context,
              orders.isEmpty
                  ? 'Your orders are up to date'
                  : 'Latest order: ${orders.first.summary}',
            ),
          ),
          _settingItem(
            icon: Icons.favorite_border_rounded,
            title: 'Saved items',
            subtitle: '4 pieces waiting for you',
            onTap: () => _showMessage(context, 'Saved items coming right up'),
          ),
          _settingItem(
            icon: Icons.local_shipping_outlined,
            title: 'Delivery addresses',
            subtitle: 'Home · Jakarta, Indonesia',
            onTap: () {},
          ),
          const SizedBox(height: 15),
          _settingItem(
            icon: Icons.help_outline_rounded,
            title: 'Help & support',
            subtitle: 'We are here when you need us',
            onTap: () => _showMessage(context, 'A concierge will be with you soon'),
          ),
          _settingItem(
            icon: Icons.logout_rounded,
            title: 'Sign out',
            subtitle: 'See you soon, Fulan',
            accent: coral,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2B253F), Color(0xFF20242B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: lavender.withValues(alpha: .18)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
              width: 62,
              height: 62,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.person_rounded, color: ink, size: 34),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fulan',
                style: GoogleFonts.instrumentSerif(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'fulan@example.com',
                style: TextStyle(color: muted, fontSize: 12),
              ),
              SizedBox(height: 8),
              Text(
                'BAKUL member since 2024',
                style: TextStyle(color: mint, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _settingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color accent = mint,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      onTap: onTap,
      leading: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(
          color: accent.withValues(alpha: .13),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: .18),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Icon(icon, color: accent, size: 21),
      ),
      title: Text(
        title,
        style: GoogleFonts.instrumentSans(
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          subtitle,
          style: const TextStyle(color: muted, fontSize: 12),
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: muted),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  String _currency(double value) => '\$${value.toStringAsFixed(0)}';

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: surfaceElevated,
        title: const Text('Sign out?'),
        content: const Text(
          'You can always come back whenever inspiration strikes.',
          style: TextStyle(color: muted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pushReplacementNamed(context, 'LoginPage');
            },
            style: FilledButton.styleFrom(backgroundColor: coral, foregroundColor: ink),
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
