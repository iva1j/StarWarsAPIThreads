class StarWarsModel {
  final List name;
  StarWarsModel({this.name});
  factory StarWarsModel.fromJson(Map<String, dynamic> json) {
    return StarWarsModel(
      name: json['results'],
    );
  }
}
