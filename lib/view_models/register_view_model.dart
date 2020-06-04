import 'package:UIPlayGround/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:UIPlayGround/services/database_service.dart';
import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'base_model.dart';
import 'package:UIPlayGround/models/user_model.dart';

class RegisterViewModel extends BaseModel {
// service 단에 있는 AuthService 클래스를 불러와서
  final AuthService _auth = AuthService();
  final auth = AuthService().auth;
  final DatabaseService _db = DatabaseService();
  Map<String, dynamic> userData;

  // 회원가입 function을 만든다.
  Future register(
      {@required String userName,
      @required String email,
      @required String password}) async {
    var result = await _auth.registerWithEmail(
        userName: userName, email: email, password: password);
    // var user = await auth.currentUser();
    // userData = {'userName': userName, 'email': email};
    // print(userData);
    // // setDataMap에 넣고자하는 userData를 Map 타입으로 받아서 바로 넣기 -> userModel 필요할듯
    // await _db.createAtDB(
    //     collection: 'users', document: user.uid, setDataMap: userData);

    // ID가 있으면
    if (result is bool) {
      if (result) {
        print('Register Success');
        // HomeView로 이동
        locator<NavigationService>().navigateTo('loggedIn');
      } else {
        print('Register Failure');
      }
    } else {
      print(result.toString());
    }
  }
}
