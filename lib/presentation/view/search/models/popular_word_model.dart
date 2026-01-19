class PopularWordModel {
  final String firstKeyword;
  final String secondKeyword;

  const PopularWordModel({
    required this.firstKeyword,
    required this.secondKeyword,
  });

  PopularWordModel copyWith({String? firstKeyword, String? secondKeyword}) {
    return PopularWordModel(
      firstKeyword: firstKeyword ?? this.firstKeyword,
      secondKeyword: secondKeyword ?? this.secondKeyword,
    );
  }
}
