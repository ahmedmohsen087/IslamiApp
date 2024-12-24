import 'package:flutter/material.dart';
import '../../../core/theme/aap_colors.dart';

class CustomNavbarItem extends StatelessWidget {
  final int selectedIndex;

  final int navBarItem;

  final String iconBath;

  const CustomNavbarItem(
      {super.key,
      required this.selectedIndex,
      required this.navBarItem,
      required this.iconBath});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: selectedIndex == navBarItem
              ? AppColors.gray.withValues(alpha: .5)
              : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ImageIcon(AssetImage(iconBath)));
  }
}
