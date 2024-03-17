class Popular {
  final int id;
  final String name;
  final String description;
  final String price;
  final String discount;
  final String image;
  final int cat_id;

  Popular( 
      {required this.id,
      required this.name,
      required this.cat_id,
      required this.description,
      required this.price,
      required this.discount,
      required this.image});
  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        discount: json['discounted_price'], cat_id: json['category_id']);
  }
}
