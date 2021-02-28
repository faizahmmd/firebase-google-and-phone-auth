// import 'dart:async';
//
// import 'package:demomachinetest/src/models/login_request_model.dart';
// import 'package:demomachinetest/src/models/login_response_model.dart';
// import 'package:demomachinetest/src/models/state.dart';
// import 'package:demomachinetest/src/utils/constants.dart';
// import 'package:demomachinetest/src/utils/object_factory.dart';
// import 'package:demomachinetest/src/utils/validators.dart';
//
// import 'base_bloc.dart';
//
// /// api response of login is managed by AuthBloc
// /// stream data is handled by StreamControllers
//
// class UserBloc extends Object with Validators implements BaseBloc {
//   StreamController<bool> _loading = new StreamController<bool>.broadcast();
//
//   StreamController<LoginResponse> _login =
//       new StreamController<LoginResponse>.broadcast();
//
//   // ignore: close_sinks
//
//   // stream controller is broadcasting the  details
//
//   /// stream for progress bar
//   Stream<bool> get loadingListener => _loading.stream;
//
//   Stream<LoginResponse> get loginResponse => _login.stream;
//
//   StreamSink<bool> get loadingSink => _loading.sink;
//
//   login({LoginRequest loginRequest}) async {
//     loadingSink.add(true);
//
//     State state = await ObjectFactory().repository.login(
//         loginRequest: LoginRequest(
//             username: loginRequest.username, password: loginRequest.password));
//
//     if (state is SuccessState) {
//       loadingSink.add(false);
//       _login.sink.add(state.value);
//     } else if (state is ErrorState) {
//       loadingSink.add(false);
//       _login.sink.addError(Constants.SOME_ERROR_OCCURRED);
//     }
//   }
//
//   ///disposing the stream if it is not using
//   @override
//   void dispose() {
//     _loading?.close();
//     _login?.close();
//   }
// }
