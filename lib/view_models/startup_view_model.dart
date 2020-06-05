import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:UIPlayGround/view_models/base_model.dart';

class StartUpViewModel extends BaseModel {
  final _auth = AuthService();
  final NavigationService _navigationService = locator<NavigationService>();

  // View에서 아래 Future 함수를 호출하면, authService의 isUserLoggedIn을 호출하여 유저 로그인 여부를 체크한다.
  Future handleStartUpLogic() async {
    var hasUserLoggedIn = await _auth.isUserLoggedIn();

    // 로그인 됐다면 loggedIn 페이지로 라우트하고
    if (hasUserLoggedIn) {
      _navigationService.navigateTo('loggedIn');
      // 그렇지 않으면 login화면을 부른다.
    } else {
      _navigationService.navigateTo('login');
    }
  }
}
