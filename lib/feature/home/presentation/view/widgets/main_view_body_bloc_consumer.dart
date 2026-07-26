import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          buildMessageBar(context, 'تمت العملية بنجاح');
        }
        if (state is CartProductRemoved) {
          buildMessageBar(context, 'تم حذف العنصر بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
