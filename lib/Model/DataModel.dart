class DataModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  DataModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Map<String, dynamic> toJson() {
    return {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body,
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
