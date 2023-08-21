class ApiModel {
  int userId;
  int id;
  String title;
  String body;

  ApiModel({
    required this.body,
    required this.userId,
    required this.title,
    required this.id,
  });
  factory ApiModel.fromJson({required Map data}) {
    return ApiModel(
        body: data['body'],
        userId: data['userId'],
        title: data['title'],
        id: data['id']);
  }
}
