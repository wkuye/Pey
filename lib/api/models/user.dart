class User {
  final String name;
  final int id;
  final String email;
  final String token;
  final dynamic balance;
  final dynamic expenses;
  final String image;
  User(this.name, this.id, this.email, this.token, this.balance, this.expenses, this.image);
  factory User.fromjson(Map<String, dynamic> json) {
    return User(
        json['user']['name'] ?? '',
        json['user']['id'] ?? 0,
        json['user']['email'] ?? '',
        json['token'] ?? '',
        json['user']['balance'],
        json['user']['expenses'],
        json['user']['image']??'');
  }
}
