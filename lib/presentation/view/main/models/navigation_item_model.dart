class NavigationItemModel {
  final String activeImageUrl;
  final String inActiveImageUrl;

  const NavigationItemModel({
    required this.activeImageUrl,
    required this.inActiveImageUrl,
  });

  NavigationItemModel copyWith({
    String? activeImageUrl,
    String? inActiveImageUrl,
  }) {
    return NavigationItemModel(
      activeImageUrl: activeImageUrl ?? this.activeImageUrl,
      inActiveImageUrl: inActiveImageUrl ?? this.inActiveImageUrl,
    );
  }
}
