class UserModel {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;

    return data;
  }

  static List<UserModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserModel>() : json.map((value) => new UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserModel>();

    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserModel.fromJson(value));
    }

    return map;
  }
}
