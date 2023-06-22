import 'package:flutter_provider_shop/domain/model/products_model.dart';

class ShopCart {
  final Products product;
  int quantity;

  ShopCart({
    required this.product,
    this.quantity = 1,
  });
}
