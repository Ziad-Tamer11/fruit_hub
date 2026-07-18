import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

AppBar buildCustomAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
    ),
  );
}
