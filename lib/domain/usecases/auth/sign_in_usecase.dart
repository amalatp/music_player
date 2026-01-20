import 'package:dartz/dartz.dart';
import 'package:music_player/core/usecase/usecase.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';
import 'package:music_player/domain/repositories/auth/auth.dart';
import 'package:music_player/service_locator.dart';

class SignInUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
