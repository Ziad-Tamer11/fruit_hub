import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/feature/checkout/data/model/order_model.dart';
import 'package:fruit_hub/feature/checkout/data/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub/feature/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      var data = await databaseService.addData(
        path: BackendEndpoint.orders,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return right(data);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
