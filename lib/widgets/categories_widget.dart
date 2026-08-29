import 'package:flutter/material.dart';

import '../theme.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _selected = 0;

  final categories = const [
    ('All', Icons.grid_view_rounded, coral),
    ('Fashion', Icons.checkroom_rounded, lavender),
    ('Beauty', Icons.spa_rounded, mint),
    ('Home', Icons.chair_rounded, cream),
    ('Tech', Icons.headphones_rounded, Color(0xFFF2B5D4)),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = index == _selected;
          return GestureDetector(
            onTap: () => setState(() => _selected = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 68,
              decoration: BoxDecoration(
                color: selected ? category.$3 : surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? category.$3 : surfaceElevated,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    category.$2,
                    size: 25,
                    color: selected ? ink : category.$3,
                  ),
                  Text(
                    category.$1,
                    style: TextStyle(
                      color: selected ? ink : Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
