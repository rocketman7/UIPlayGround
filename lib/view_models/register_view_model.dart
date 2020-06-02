import 'package:UIPlayGround/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../views/home_view.dart';
import 'package:UIPlayGround/services/database_service.dart';
import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'base_model.dart';

class RegisterViewModel extends BaseModel {
// service 단에 있는 AuthService 클래스를 불러와서
  final AuthService _auth = AuthService();
  final auth = AuthService().auth;
  final DatabaseService _db = DatabaseService();
  Map<String, dynamic> userData;

  // 회원가입 function을 만든다.
  Future register(
      {@required String nickName,
      @required String email,
      @required String password}) async {
    var result =
        await _auth.registerWithEmail(email: email, password: password);
    var user = await auth.currentUser();
    userData = {'userName': nickName, 'email': email};
    print(userData);
    await _db.createAtDB(
        collection: 'users', document: user.uid, setDataMap: userData);

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
