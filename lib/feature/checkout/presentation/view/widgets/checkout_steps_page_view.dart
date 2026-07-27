import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/payment_section.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required GlobalKey<FormState> formKey,
    required this.valueListenable,
  }) : _formKey = formKey;

  final PageController pageController;

  final GlobalKey<FormState> _formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
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
      AddressInputSection(formKey: _formKey, valueListenable: valueListenable),
      PaymentSection(),
    ];
  }
}
