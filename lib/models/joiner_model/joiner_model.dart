class JoinerModel {
  final String? userId;
  final String? userName;
  final int? amount;
  final int? realAmount;
  final String? lotId;
  final DateTime? time;
  JoinerModel(
      {this.userId,
      this.userName,
      this.amount,
      this.realAmount,
      this.lotId,
      this.time});

  factory JoinerModel.fromJson(Map<String, dynamic> json) {
    return JoinerModel(
      userId: json['userId'],
      userName: json['userName'],
      amount: json['amount'],
      realAmount: json['realAmount'],
      lotId: json['lotId'],
      time: DateTime.parse(json["time"]),
    );
  }
}
