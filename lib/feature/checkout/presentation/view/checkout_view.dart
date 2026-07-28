import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/get_user.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/feature/checkout/data/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/feature/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/feature/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(ordersRepo: getIt.get<OrdersRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: Provider(
            create: (_) =>
                OrderEntity(uId: getUser().uId, cartEntity: cartEntity),
            child: const CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}
