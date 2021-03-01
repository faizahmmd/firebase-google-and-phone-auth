import 'package:demomachinetest/src/models/state.dart';
import 'package:demomachinetest/src/resources/api_providers/user_api_provider.dart';

/// Repository is an intermediary class between network and data
class Repository {
  final userApiProvider = UserApiProvider();

  Future<State> getDishList() => UserApiProvider().getDishList();
}
