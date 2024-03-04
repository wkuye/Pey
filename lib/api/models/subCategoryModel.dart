class SubCategory {
  final int id;
  final String name;
  final String description1;
  final String description2;
  final String image;

  SubCategory(
      {required this.id,
      required this.name,
      required this.description1,
      required this.description2,
      required this.image});
  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
        id: json['id'],
        name: json['name'],
        description1: json['description_one'],
        description2: json['description_two'],
        image: json['image']);
  }
}
