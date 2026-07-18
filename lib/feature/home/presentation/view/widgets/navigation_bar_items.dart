import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/active_item.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/in_active_item.dart';

class NavigationBarItems extends StatelessWidget {
  const NavigationBarItems({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(image: bottomNavigationBarEntity.activeImage)
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
