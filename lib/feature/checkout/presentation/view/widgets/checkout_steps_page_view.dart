import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/payment_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages().length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [ShippingSection(), AddressInputSection(), PaymentSection()];
  }
}
