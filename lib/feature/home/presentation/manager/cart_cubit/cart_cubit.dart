import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_entity.dart';
import 'package:fruit_hub/feature/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    if (isProductExist) {
      // increase count product
    } else {
      CartItemEntity cartItemEntity = CartItemEntity(
        productEntity: productEntity,
        count: 1,
      );
      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartItemAdded());
  }
}
