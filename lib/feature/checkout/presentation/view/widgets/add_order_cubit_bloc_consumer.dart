import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/show_message_bar.dart';
import 'package:fruit_hub/feature/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showMessageBar(context, 'تمت العملية بنجاح');
        } else if (state is AddOrderFailure) {
          showMessageBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
