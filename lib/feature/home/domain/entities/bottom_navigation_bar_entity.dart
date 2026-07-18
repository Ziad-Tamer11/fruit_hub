import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHome,
    inActiveImage: Assets.imagesHomeSelected,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesProduct,
    inActiveImage: Assets.imagesProductSelected,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesShoppingCart,
    inActiveImage: Assets.imagesShoppingCartSelected,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesUser,
    inActiveImage: Assets.imagesUserSelected,
    name: 'حسابي',
  ),
];
