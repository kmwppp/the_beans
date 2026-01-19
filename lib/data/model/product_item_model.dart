class ProductItemModel {
  final String imageUrl;
  final String title;
  final String cupnote;
  final String brandImageUrl;
  final String price;

  const ProductItemModel({
    required this.imageUrl,
    required this.title,
    required this.cupnote,
    required this.brandImageUrl,
    required this.price,
  });

  ProductItemModel copyWith({
    String? imageUrl,
    String? title,
    String? cupnote,
    String? brandImageUrl,
    String? price,
  }) {
    return ProductItemModel(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      cupnote: cupnote ?? this.cupnote,
      brandImageUrl: brandImageUrl ?? this.brandImageUrl,
      price: price ?? this.price,
    );
  }
}
