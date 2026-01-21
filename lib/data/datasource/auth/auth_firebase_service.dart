import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });

      return const Right('Sign up successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'An unknown error occurred.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Sign in successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The email provided is invalid.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'The password provided is incorrect.';
      } else if (e.code == 'invalid-credential') {
        message = 'The credential provided is invalid.';
      } else {
        message = 'An unknown error occurred.';
      }
      return Left(message);
    }
  }
}
