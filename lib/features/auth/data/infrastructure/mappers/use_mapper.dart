
import 'package:flutter_application_1/features/auth/data/models/user_model.dart';
import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';

class UseMapper {
  static UserEntity userModelToEntity(UserModel userModel){
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
    
    );
  }
}