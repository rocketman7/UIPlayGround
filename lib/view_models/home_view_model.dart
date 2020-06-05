import 'package:UIPlayGround/models/user_model.dart';
import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/database_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:UIPlayGround/locator.dart';

import 'base_model.dart';

class HomeViewModel {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  final NavigationService _navigationService = locator<NavigationService>();

  User _currentUser;

  Future signOut() async {
    await _authService.signOut();
    var hasUserLoggedIn = await _authService.isUserLoggedIn();
    if (hasUserLoggedIn) {
      _navigationService.navigateTo('loggedIn');
    } else {
      _navigationService.navigateTo('login');
    }
  }

  // HomeView에서 Futurebuilder의 future 함수로 아래를 호출할 것
  // 함수가 호출되면, 1. Auth의 currentUser에서 uid를 가져오고, 2. 그 uid를 이용하여 dbService의 getUser함수를 불러
  // User class의 _currentUser를 할당한다
  Future getUser() async {
    var userResult = await FirebaseAuth.instance.currentUser();
    _currentUser = await _databaseService.getUser(userResult.uid);
    return _currentUser;
  }
  // Future getUserUid() async {
  //   // final FirebaseUser user = await _authService.currentUser();
  //   final uid = user.uid;
  //   final email = user.email;

  //   print([uid, email]);
  //   return [uid, email];
  // }
}
