import 'package:flutter/material.dart';

import '../theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: coral,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.auto_awesome, color: ink, size: 22),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, Fulan',
                style: TextStyle(color: muted, fontSize: 12),
              ),
              SizedBox(height: 2),
              Text(
                'Find your next favorite',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Messages',
            onPressed: () => Navigator.pushNamed(context, 'ListChat'),
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            color: Colors.white,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                tooltip: 'Notifications',
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
                color: Colors.white,
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: coral,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
