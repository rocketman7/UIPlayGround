import 'package:UIPlayGround/locator.dart';
import 'package:UIPlayGround/services/navigation_service.dart';
import 'package:UIPlayGround/views/login_view.dart';
import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/register_view.dart';
import 'locator.dart';
import 'services/navigation_service.dart';

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
          case 'loggedIn':
            return MaterialPageRoute(builder: (context) => HomeView());
          case 'register':
            return MaterialPageRoute(builder: (context) => RegisterView());
          default:
            return MaterialPageRoute(builder: (context) => LoginView());
        }
      },
      home: LoginView(),
    );
  }
}
