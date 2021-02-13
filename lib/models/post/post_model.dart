class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;

    return data;
  }

  static List<PostModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<PostModel>() : json.map((value) => new PostModel.fromJson(value)).toList();
  }

  static Map<String, PostModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PostModel>();

    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PostModel.fromJson(value));
    }

    return map;
  }
}
