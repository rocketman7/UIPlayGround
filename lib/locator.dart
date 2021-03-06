import 'package:get_it/get_it.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

// 앞서 만든 서비스들을 setupLocator에 설정하고 main.dart에 injection 한다
// main에서 직접 연결되는 클래스에서는 바로 사용가능한데, 개별 클래스에서는 locator와 service를 import해야 하는듯?
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
