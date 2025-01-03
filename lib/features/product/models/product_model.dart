class ProductModel {
  final String? id;
  final String? title;
  final String? description;
  final List<String>? images;
  final double? priceCustomer;
  final double? priceReseller;
  final int? stock;
  final List<String>? packages;
  final List<String>? colors;
  final double? commision;
  final double? commisionPercentage;
  final String? shopName;
  final bool isNew;

  ProductModel({
     this.id,
    required this.title,
    this.description,
    required this.images,
    required this.priceCustomer,
    this.priceReseller,
    required this.stock,
     this.packages,
    this.colors,
    this.commision,
    this.commisionPercentage,
    this.shopName,
    required this.isNew,
  });
}
