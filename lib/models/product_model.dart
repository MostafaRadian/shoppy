class ProductModel{
  List products;

  ProductModel({required this.products});

  factory ProductModel.fromJson({required List json}){
    return ProductModel(products: json);
  }
}