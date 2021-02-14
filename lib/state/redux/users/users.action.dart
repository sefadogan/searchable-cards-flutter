// Models
import 'package:SearchableCards/models/user/user_model.dart';

class SetUsersAction {
  final List<UserModel> _users;

  List<UserModel> get users => this._users;

  SetUsersAction(this._users);
}
