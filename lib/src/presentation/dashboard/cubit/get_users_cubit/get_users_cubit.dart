import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/const_methods.dart';
import 'package:task_test/src/core/consts/endpoints.dart';
import 'package:task_test/src/core/services/dio_service.dart';
import 'package:task_test/src/data/model/user_model.dart';
import 'package:task_test/src/data/reponse/get_users_response_model.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  static GetUsersCubit get(BuildContext context) => BlocProvider.of(context);

  final _users = <User>[];

  List<User> get users => _users;

  Future getUsers() async {
    const tag = "GetUsersCubit getUsers";
    try {
      emit(GetUsersLoadingState());
      final response = await DioService.getData(
        url: EndPoints.epGetUsers,
      );
      logSuccess("$tag Response: $response");
      final model = GetUsersResponseModel.fromJson(response.data);
      users.clear();
      users.addAll(model.users);
      emit(GetUsersSuccessState());
    } on DioException catch (dioError) {
      logError("$tag Server Error: ${dioError.response}");
      emit(GetUsersErrorState(kDebugMode ? "" : "Server Error"));
    } catch (error) {
      logError("$tag Error: $error");
      emit(GetUsersErrorState(kDebugMode ? "" : "Unknown Error"));
    }
  }
}
