class HomeCategoryModel {
  final String iconUrl;
  final String title;

  const HomeCategoryModel({required this.iconUrl, required this.title});

  HomeCategoryModel copyWith({String? iconUrl, String? title}) {
    return HomeCategoryModel(
      iconUrl: iconUrl ?? this.iconUrl,
      title: title ?? this.title,
    );
  }
}
