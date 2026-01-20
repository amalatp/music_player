import 'package:dartz/dartz.dart';
import 'package:music_player/data/datasource/auth/auth_firebase_service.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/domain/repositories/auth/auth.dart';
import 'package:music_player/service_locator.dart';

class AuthRepoImpl implements AuthRepository {
  @override
  Future<bool> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
