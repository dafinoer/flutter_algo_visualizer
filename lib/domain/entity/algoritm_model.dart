class AlgorithmModel {
  final String title;
  final String? desc;
  final String bigNotationDetail;

  const AlgorithmModel({
    required this.title,
    this.desc,
    required this.bigNotationDetail,
  });

  factory AlgorithmModel.fromMap(Map<String, dynamic> map) => AlgorithmModel(
        title: map['title'] as String,
        bigNotationDetail: map['time_complex'] as String,
        desc: map['desc'] as String,
      );

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlgorithmModel &&
        other.desc == desc &&
        other.title == title &&
        other.bigNotationDetail == other.bigNotationDetail;
  }

  @override
  int get hashCode => Object.hashAll([
        desc,
        bigNotationDetail,
        title,
      ]);
}
