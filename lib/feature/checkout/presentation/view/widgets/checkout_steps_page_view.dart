import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/payment_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final PageController pageController;

  final GlobalKey<FormState> _formKey;
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
    return [
      ShippingSection(),
      AddressInputSection(formKey: _formKey),
      PaymentSection(),
    ];
  }
}
