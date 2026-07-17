import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      child: Stack(
        children: [
          Center(child: Image.asset(Assets.imagesFeatured)),
          Container(
            width: itemWidth * .5,
            height: 158,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: svg.Svg(Assets.imagesFeaturedItemBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'عروض العيد',
                    style: TextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    'خصم 25%',
                    style: TextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 11),
                  FeaturedItemButton(onPressed: () {}),
                  SizedBox(height: 29),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
