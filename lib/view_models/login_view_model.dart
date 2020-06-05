import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:UIPlayGround/locator.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
// service 단에 있는 AuthService 클래스를 불러와서
  final AuthService _authService = AuthService();
  final NavigationService _naviService = locator<NavigationService>();
  // 로그인 function. View로부터 전달받은 계정정보를 input으로 authService의 로그인 함수를 호출.
  Future login({@required String email, @required String password}) async {
    var result =
        await _authService.loginWithEmail(email: email, password: password);
    // ID가 있으면
    if (result is bool) {
      if (result) {
        print('Login Success');
        // loggedIn 화면으로 route (HomeView)
        _naviService.navigateTo('loggedIn');
      } else {
        print('Login Failure');
      }
    } else {
      print(result.toString());
    }
  }
}
