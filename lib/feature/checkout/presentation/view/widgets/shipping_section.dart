import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32),
        ShippingItem(
          isSelected: true,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '23',
        ),
        SizedBox(height: 8),
        ShippingItem(
          isSelected: false,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
