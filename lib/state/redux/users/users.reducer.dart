// Models
import 'package:SearchableCards/models/user/user_model.dart';
// State
import 'package:SearchableCards/state/redux/users/users.action.dart';

List<UserModel> usersReducer(List<UserModel> users, dynamic action) {
  if (action is SetUsersAction) {
    return action.users;
  }

  return users;
}
