import '../../models/models.dart';

class UserResponseApi {
  String message;
  Data data;

  UserResponseApi({required this.message, required this.data});

  factory UserResponseApi.fromJson(Map<String, dynamic> json) =>
      UserResponseApi(message: json["message"], data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  UserModel user;
  String token;

  Data({required this.user, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(user: UserModel.fromJson(json["user"]), token: json["token"]);

  Map<String, dynamic> toJson() => {"user": user.toJson(), "token": token};
}
