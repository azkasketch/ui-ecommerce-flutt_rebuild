import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          const Icon(Icons.sort, color: Color(0xFF4C53A5), size: 30.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'EcoGlobal',
              style: TextStyle(
                color: Color(0xFF4C53A5),
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(7.0),
            ),
            badgeContent: const Text(
              '9',
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'ListChat');
              },
              child: const Icon(Icons.message_sharp,
                  color: Color(0xFF4C53A5), size: 32.0),
            ),
          ),
        ],
      ),
    );
  }
}