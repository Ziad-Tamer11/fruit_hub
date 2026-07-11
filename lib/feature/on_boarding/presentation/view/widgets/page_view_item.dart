import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
  });
  final String image, backgroundImage, subTitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
