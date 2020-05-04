import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class SessionHandlerRepository {
  Future<Either<Exception, FirebaseUser>> login({@required String email,@required String password});
  Future<Either<Exception, bool>> logout();
}