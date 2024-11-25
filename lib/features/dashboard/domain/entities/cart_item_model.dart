class CartItemEntity {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariaition;

  // constructor
  CartItemEntity(
      {required this.productId,
      this.title = '',
      this.price = 0.0,
      this.image,
      required this.quantity,
      this.variationId = '',
      this.brandName,
      this.selectedVariaition});
}
