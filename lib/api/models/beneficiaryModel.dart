class beneficiary {
  final int id;
  final int currentUser;
  final int benId;
  final String beneficiary_name;
  final String beneficiary_email;
  final String beneficiary_image;
  final String beneficiary_lastname;

  beneficiary(
      this.id,
      this.currentUser,
      this.beneficiary_name,
      this.beneficiary_email,
      this.beneficiary_image,
      this.beneficiary_lastname, this.benId);
  factory beneficiary.fromJson( Map<String, dynamic> json) {
    return beneficiary(json['id'], json['user_id'], json['name'], json['email'],
        json['image'] ?? '', json['last_name'], json['ben_id']);
  }
}
