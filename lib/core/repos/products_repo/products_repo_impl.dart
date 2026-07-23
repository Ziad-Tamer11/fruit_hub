import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } on Exception catch (e) {
      return left(ServerFailure('Failed to get Products'));
    }
  }
}
