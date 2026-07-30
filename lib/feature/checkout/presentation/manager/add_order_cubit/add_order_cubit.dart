import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/feature/checkout/data/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> addOrder({
    required OrderEntity orderEntity,
    required OrderEntity order,
  }) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.errMessage)),
      (order) => emit(AddOrderSuccess()),
    );
  }
}
