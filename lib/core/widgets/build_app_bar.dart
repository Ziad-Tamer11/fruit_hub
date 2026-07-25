import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
}) {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
    centerTitle: true,
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    ),
  );
}
