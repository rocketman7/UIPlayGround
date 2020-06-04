import 'dart:math';

import 'package:UIPlayGround/services/auth_service.dart';

import 'package:UIPlayGround/services/database_service.dart';
import 'package:UIPlayGround/view_models/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final _auth = AuthService().auth;
  // final _db = DatabaseService().db;

  String userEmail = "a";
  String userUid;
  String userNickName = "b";

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _homeModel = HomeViewModel();
    // _homeModel.getUserUid();
    // getUser();
    // getNickName();
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(userNickName),
          Center(
            child: Container(
              // color: Colors.white,
              padding: EdgeInsets.all(8),
              // constraints: BoxConstraints.expand(),
              alignment: Alignment.center,
              width: 200,
              height: 200,
              // transform: Matrix4.rotationZ(.5),
              decoration: BoxDecoration(
                // color: Colors.blueGrey,
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(4, 4),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.blueGrey,
                  ],
                ),
                // shape: BoxShape.circle,
              ),
              child: FlatButton(
                onPressed: () {
                  _homeModel.signOut();
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(userEmail),
        ],
      ),
    );
  }
}
