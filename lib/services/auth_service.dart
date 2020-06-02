import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  // 이메일 회원가입
  Future registerWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }
  // 구글 계정 로그인

  // Reset 비밀번호

  // Update 유저

  // 탈퇴

}
