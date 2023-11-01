import 'package:task_test/src/data/model/user_model.dart';

class GetUsersResponseModel {
  final List<User> users;

  GetUsersResponseModel({
    required this.users,
  });

  factory GetUsersResponseModel.fromJson(List<dynamic> data) {
    return GetUsersResponseModel(
      users: data
          .map(
            (e) => User.fromJson(e),
          )
          .toList(),
    );
  }
}
