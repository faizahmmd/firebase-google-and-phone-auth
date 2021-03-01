import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/models/state.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';

class UserApiProvider {
  Future<State> getDishList() async {
    final response = await ObjectFactory().apiClient.getDishList();
    //print(response.toString());
    if (response.statusCode == 200) {
      return State<GetDishListResponse>.success(
          GetDishListResponse.fromJson(response.data[0]));
    } else
      return null;
  }
}
