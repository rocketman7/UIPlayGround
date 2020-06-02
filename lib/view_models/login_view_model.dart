import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../views/home_view.dart';
import 'package:UIPlayGround/locator.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
// service 단에 있는 AuthService 클래스를 불러와서
  final AuthService _authService = AuthService();
  final NavigationService _naviService = locator<NavigationService>();
  // 로그인 function을 만든다.
  Future login({@required String email, @required String password}) async {
    var result =
        await _authService.loginWithEmail(email: email, password: password);
    // ID가 있으면
    if (result is bool) {
      if (result) {
        print('Login Success');
        _naviService.navigateTo('loggedIn'); // HomeView로 가는 것만 해결하면 됨
      } else {
        print('Login Failure');
      }
    } else {
      print(result.toString());
    }
  }
}
