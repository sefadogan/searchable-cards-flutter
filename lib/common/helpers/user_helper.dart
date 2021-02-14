// Models
import 'package:SearchableCards/models/user/user_model.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';

class UserHelper {
  static UserModel getUserById(int id, AppState state) {
    final users = state.users;

    return users.firstWhere((user) => user.id == id);
  }
}
