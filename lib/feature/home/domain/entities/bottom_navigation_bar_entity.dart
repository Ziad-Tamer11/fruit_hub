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
    inActiveImage: Assets.imagesHome,
    activeImage: Assets.imagesHomeSelected,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesProduct,
    activeImage: Assets.imagesProductSelected,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesShoppingCart,
    activeImage: Assets.imagesShoppingCartSelected,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesUser,
    activeImage: Assets.imagesUserSelected,
    name: 'حسابي',
  ),
];
