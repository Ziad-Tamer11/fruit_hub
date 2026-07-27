import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/order_summary.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 24), OrderSummary(), SizedBox(height: 16)],
    );
  }
}
