import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/database_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:UIPlayGround/locator.dart';

import 'base_model.dart';

class HomeViewModel {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signOut() async {
    await _authService.signOut();
    var hasUserLoggedIn = await _authService.isUserLoggedIn();
    if (hasUserLoggedIn) {
      _navigationService.navigateTo('loggedIn');
    } else {
      _navigationService.navigateTo('login');
    }
  }
  // Future getUserUid() async {
  //   // final FirebaseUser user = await _authService.currentUser();
  //   final uid = user.uid;
  //   final email = user.email;

  //   print([uid, email]);
  //   return [uid, email];
  // }
}
