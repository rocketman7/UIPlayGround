import 'package:UIPlayGround/models/user_model.dart';
import 'package:UIPlayGround/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;
  final DatabaseService _db = DatabaseService();

  User _currentUser;
  User get currentUser => _currentUser;

// isUserLoggedIn??
  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    await _populateCurrentUser(user);
    // 로그인 되었다면 return true, 로그인 안 된 상태면 false
    return user != null;
  }

  // 이메일 회원가입
  Future registerWithEmail({
    @required String userName,
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // 유저정보 DB에 넣기
      _currentUser = User(
        uid: authResult.user.uid,
        userName: userName,
        email: email,
      );

      await _db.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
  // 구글 계정 회원가입

  // 이메일 로그인
  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
  // 구글 계정 로그인

  // 로그아웃
  Future signOut() async {
    await _auth.signOut();
  }

  // 유저 정보 multiple places에 뿌리기
  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _db.getUser(user.uid);
    }
  }

  // Reset 비밀번호

  // Update 유저

// 유저 데이터 가져오기

  // Future currentUser() async {
  //   var user = _auth.currentUser();
  //   return user;
  // }
  // 탈퇴

}
