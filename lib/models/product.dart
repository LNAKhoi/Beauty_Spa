class Product {
  final String productId;
  final String productName;
  final String productPrice;
  final String productAmount;

  Product(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productAmount});

  Map<String, dynamic> toJson() {
    return {
      'id': productId,
      'name': productName,
      'price': productPrice,
      'amount': productAmount
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        productId: json['id'],
        productName: json['name'],
        productPrice: json['price'],
        productAmount: json['amount']);
  }
}
