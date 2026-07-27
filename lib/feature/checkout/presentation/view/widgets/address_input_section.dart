import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.valueListenable,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: valueListenable,
      builder: (context, value, child) => Form(
        autovalidateMode: value,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.name =
                      value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      value!;
                },
                hintText: 'العنوان',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: 'المدينه',
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.city =
                      value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: 'رقم الطابق , رقم الشقه ..',
                onSaved: (value) {
                  context
                          .read<OrderEntity>()
                          .shippingAddressEntity!
                          .addressDetails =
                      value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 8),

              CustomTextFormField(
                hintText: 'رقم الهاتف',
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.number =
                      value!;
                },
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
