import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class SessionHandlerRepository {
  Future<Either<Exception, FirebaseUser>> login(
      {@required String email, @required String password});
  Future<Either<Exception, bool>> logout();
  Future<Either<Exception, FirebaseUser>> checkIfLoggedIn();
  Future<Either<Exception, FirebaseUser>> signUp(
      {@required String email, @required String password});
  Future<Either<Exception, bool>> waitingForEmailVerification();
  Future<Either<Exception, bool>> resendVerificationEmail();
  Future<Either<Exception, bool>> updateUserData(
      {@required String displayname, @required String phoneNumber});
  Future<Either<Exception, String>> getAccountType(
      {@required String userUID, @required String fcmToken});
  Future<Either<Exception, bool>> updateAccountType(
      {@required String userUID, @required String type});
}
