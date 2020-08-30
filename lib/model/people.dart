class StarWarsModel {
  final List results;
  StarWarsModel({this.results});
  factory StarWarsModel.fromJson(Map<String, dynamic> json) {
    return StarWarsModel(
      results: json['results'],
    );
  }
}
