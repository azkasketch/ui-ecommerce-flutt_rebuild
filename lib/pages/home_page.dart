import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import '../widgets/categories_widget.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/items_widget.dart';
import 'account_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        backgroundColor: surface,
        indicatorColor: coral.withValues(alpha: .18),
        height: 74,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: coral),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag_rounded, color: coral),
            label: 'Bag',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: coral),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBar()),
          SliverToBoxAdapter(child: _searchBar()),
          SliverToBoxAdapter(child: _heroBanner()),
          const SliverToBoxAdapter(child: _SectionHeading(
            title: 'Browse the edit',
            action: 'See all',
          )),
          const SliverToBoxAdapter(child: CategoriesWidget()),
          const SliverToBoxAdapter(child: _SectionHeading(
            title: 'Curated for you',
            action: 'View all',
          )),
          SliverToBoxAdapter(child: Itemswidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 28)),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products, brands & more',
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: surfaceElevated,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune_rounded, size: 19, color: mint),
          ),
        ),
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      height: 190,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 27),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFFB8A4FF), Color(0xFFE4DFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -25,
            bottom: -45,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .32),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 25,
            child: Icon(
              Icons.local_mall_rounded,
              size: 108,
              color: Colors.white.withValues(alpha: .72),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE WEEKEND EDIT',
                  style: GoogleFonts.instrumentSans(
                    color: ink,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  width: 190,
                  child: Text(
                    'Soft layers,\nstrong mood.',
                    style: GoogleFonts.instrumentSerif(
                      color: ink,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      height: 1.05,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Explore collection  →',
                  style: GoogleFonts.instrumentSans(
                    color: ink,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String action;

  const _SectionHeading({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.instrumentSerif(
              fontSize: 27,
              fontWeight: FontWeight.w700,
              letterSpacing: -.4,
              color: Colors.white,
            ),
          ),
          Text(
            action,
            style: GoogleFonts.instrumentSans(
              color: coral,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
