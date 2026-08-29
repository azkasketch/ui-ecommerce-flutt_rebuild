import 'package:flutter/material.dart';

import '../theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
        children: [
          Row(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.8,
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
          const SizedBox(height: 25),
          const Text(
            'Your space',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          _settingItem(
            icon: Icons.shopping_bag_outlined,
            title: 'Orders',
            subtitle: 'Track and manage your purchases',
            onTap: () => _showMessage(context, 'Your orders are up to date'),
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
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: lavender,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.person_rounded, color: ink, size: 34),
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fulan',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 4),
              Text(
                'fulan@example.com',
                style: TextStyle(color: muted, fontSize: 12),
              ),
              SizedBox(height: 8),
              Text(
                'VANTA member since 2024',
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
        ),
        child: Icon(icon, color: accent, size: 21),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
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
