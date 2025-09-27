import 'package:dio/dio.dart';
import 'package:shop_app_simple_1/models/product_model.dart';

class ProductService {
  static Dio dio = Dio();

  static Future<ProductModel> getProduct() async {
    final Response response = await dio.get(
      "https://fakestoreapi.com/products",
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json: response.data);
    } else {
      throw Exception("Error getting data");
    }
  }

  static Future<ProductModel> getCart() async {
    final Response response = await dio.get("https://fakestoreapi.com/carts/1");
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json: response.data);
    } else {
      throw Exception("Error getting data");
    }
  }

  static Future<bool> addToCart({required Map item}) async {
    Map data = {"id": 1, "userId": 1, "products": item};
    final Response response = await dio.post(
      "https://fakestoreapi.com/carts",
      data: data,
    );
    return response.statusCode == 201 ? true : false;
  }
}
