import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:UIPlayGround/views/login_view.dart';
import 'package:UIPlayGround/views/startup_view.dart';
import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/register_view.dart';
import 'locator.dart';
import 'services/navigation_service.dart';
import 'views/widget_test_1.dart';
import 'views/widget_test_2.dart';
import 'views/widget_test_3.dart';
import 'views/widget_test_4.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          // navigation service에서 접근할 route이름들 view설정
          case 'loggedIn':
            return MaterialPageRoute(builder: (context) => HomeView());
          case 'register':
            return MaterialPageRoute(builder: (context) => RegisterView());
          case 'login':
            return MaterialPageRoute(builder: (context) => LoginView());
          default:
            return MaterialPageRoute(builder: (context) => StartUpView());
        }
      },
      home: StartUpView(),
    );
  }
}
