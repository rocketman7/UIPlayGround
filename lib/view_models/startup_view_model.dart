import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/auth_service.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:UIPlayGround/view_models/base_model.dart';

class StartUpViewModel extends BaseModel {
  final _auth = AuthService();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasUserLoggedIn = await _auth.isUserLoggedIn();
    print(hasUserLoggedIn);

    if (hasUserLoggedIn) {
      _navigationService.navigateTo('loggedIn');
    } else {
      _navigationService.navigateTo('login');
    }
  }
}
