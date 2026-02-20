class ItemSave {
  ItemSave(this.shop, this.product, this.unity, this.price, this.quantity, this.onCart);

  int? shop;
  final String? product;
  final String? unity;
  final double price;
  final int quantity;
  final bool onCart;
}