import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/payment_item.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل :',
      child: Column(
        children: [
          Row(
            children: [
              Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(Assets.imagesLocation),
                  Text(
                    context
                        .read<OrderEntity>()
                        .shippingAddressEntity
                        .toString(),
                    textAlign: TextAlign.right,
                    style: TextStyles.regular16,
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Row(
                  spacing: 6,
                  children: [
                    SvgPicture.asset(Assets.imagesEdit),
                    Text(
                      'تعديل',
                      textAlign: TextAlign.right,
                      style: TextStyles.semiBold16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
