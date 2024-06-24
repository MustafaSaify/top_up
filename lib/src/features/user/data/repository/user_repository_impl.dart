import 'package:top_up/src/features/user/data/datasource/user_remote_datasource.dart';
import 'package:top_up/src/features/user/domain/entity/user_info.dart';
import 'package:top_up/src/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserInfo> getUserInfo() {
    return remoteDataSource.getUserInfo();
  }
}
