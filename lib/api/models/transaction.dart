class Transaction {
  final int id;
  final int userID;
  final int recepientID;
  final String amount;
  final String type;
  final String? description;
  final String createdAt;

  Transaction(this.id, this.userID, this.recepientID, this.amount, this.type,
      this.description, this.createdAt);
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(json['id'], json['user_id'], json['recipient_id'],
        json['amount'], json['type'], json['description'], json['created_at']);
  }
}
