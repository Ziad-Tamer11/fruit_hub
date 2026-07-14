import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isVisible,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: isVisible
            ? Icon(Icons.remove_red_eye)
            : Icon(Icons.visibility_off),
        color: Color(0xffC9CECF),
      ),
    );
  }
}
