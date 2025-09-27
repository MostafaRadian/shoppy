import 'package:flutter/cupertino.dart';
import 'package:shop_app_simple_1/models/product_model.dart';
import 'package:shop_app_simple_1/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? productModel;
  ProductModel? cartModel;

  List cartId = [];
  List cart = [];

  Future<void> fetchData() async {
    productModel = await ProductService.getProduct();
    notifyListeners();
  }

  Future<bool> addCart({required Map item}) async {
    cart.add(item);
    final bool added = await ProductService.addToCart(item: item);
    print(added);
    notifyListeners();
    return added;
  }

  void removeFromCart(Map item) {
    cart.remove(item);
    notifyListeners();
  }

  double calculateTotalPrice() {
    double sum = 0;
    for (var item in cart) {
      sum += (item["price"] as num).toDouble();
    }
    return sum;
  }

  Future<void> getCart() async {
    cartModel = await ProductService.getCart();
    notifyListeners();
  }

  bool isInCart(Map item) {
    return cart.contains(item);
  }
}
