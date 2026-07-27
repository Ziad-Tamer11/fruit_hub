import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),

          CustomTextFormField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'المدينه',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
