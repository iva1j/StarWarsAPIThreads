class People {
  final List charName;
  People({this.charName});
  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      charName: json['results'],
    );
  }
}
