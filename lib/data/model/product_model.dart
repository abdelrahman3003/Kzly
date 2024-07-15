class PruductModel {
  final int productId;
  final String title;
  final String subtitle;
  final String price;
  final double rating;
  final bool isInStock;
  int cartCount;
  final List<String> image;
  bool isFavorite = false;
  bool isInCart = false;
  bool isIncheckOut = true;

  PruductModel({
    required this.productId,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.isInStock,
    required this.image,
    required this.isFavorite,
    required this.isInCart,
    required this.cartCount,
  });
}
