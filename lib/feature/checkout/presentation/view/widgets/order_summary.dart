import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/payment_item.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
              Spacer(),
              Text(
                '30 جنية',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            thickness: .5,
            color: const Color(0xFFCACECE) /* Grayscale-200 */,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                textAlign: TextAlign.right,
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
