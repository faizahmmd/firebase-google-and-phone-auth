import 'dart:async';
import 'package:demomachinetest/src/models/get_dish_list_response.dart';
import 'package:demomachinetest/src/models/state.dart';
import 'package:demomachinetest/src/utils/constants.dart';
import 'package:demomachinetest/src/utils/object_factory.dart';
import 'package:demomachinetest/src/utils/validators.dart';
import 'base_bloc.dart';

/// api response of login is managed by AuthBloc
/// stream data is handled by StreamControllers

class UserBloc extends Object with Validators implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();

  StreamController<GetDishListResponse> _getDishListStreamController =
      new StreamController<GetDishListResponse>.broadcast();

  /// stream for progress bar
  Stream<bool> get loadingListener => _loading.stream;

  Stream<GetDishListResponse> get getDishListStream =>
      _getDishListStreamController.stream;

  StreamSink<bool> get loadingSink => _loading.sink;

  getDishListCall() async {
    loadingSink.add(true);

    State state = await ObjectFactory().repository.getDishList();

    if (state is SuccessState) {
      loadingSink.add(false);
      _getDishListStreamController.sink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      _getDishListStreamController.sink.addError(Constants.SOME_ERROR_OCCURRED);
    }
  }

  ///disposing the stream if it is not using
  @override
  void dispose() {
    _loading?.close();
    _getDishListStreamController?.close();
  }
}
