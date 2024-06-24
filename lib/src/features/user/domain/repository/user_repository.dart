import 'package:top_up/src/features/user/domain/entity/user_info.dart';

abstract class UserRepository {
  Future<UserInfo> getUserInfo();
}
