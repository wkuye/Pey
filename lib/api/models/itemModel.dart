class item {
  final int id;
  final int cat_id;
  final String name;
  final String price;
  final String image;
  final String description;
  final String discounted_price;

  item( 
      {required this.id,
      required this.cat_id,
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.discounted_price});
  factory item.fromJson(Map<String, dynamic> json) {
    return item(
        id: json['id'],
        cat_id: json['category_id'],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        description: json['description'],
        discounted_price: json['discounted_price']);
  }
}
