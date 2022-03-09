class ProductModel{

  String productImage;
  String productName;
  String productId;
  int productPrice;
  int productQuantity;

  ProductModel({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });
}