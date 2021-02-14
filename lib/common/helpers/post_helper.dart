// Packages
import 'dart:convert';
// Models
import 'package:SearchableCards/models/post/post_model.dart';

class PostHelper {
  static PostModel clonePost(PostModel data) {
    var jsonString = jsonEncode(data);

    var decoded = jsonDecode(jsonString);
    var clonedData = PostModel.fromJson(decoded);

    return clonedData;
  }

  static List<PostModel> clonePosts(List<PostModel> datas) {
    List<PostModel> clonedDatas = new List<PostModel>();

    for (var data in datas) {
      final clonedData = clonePost(data);
      clonedDatas.add(clonedData);
    }

    return clonedDatas;
  }
}
