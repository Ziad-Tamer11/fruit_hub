import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    actions: const [NotificationWidget()],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
    ),
  );
}
