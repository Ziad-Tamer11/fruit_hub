import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/show_message_bar.dart';
import 'package:fruit_hub/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showMessageBar(context, 'تمت العملية بنجاح');
        }
        if (state is CartItemRemoved) {
          showMessageBar(context, 'تم حذف العنصر بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
