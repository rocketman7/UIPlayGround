import 'package:UIPlayGround/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  Firestore _db = Firestore.instance;
  Firestore get db => _db;

  // Users Collection Reference
  final CollectionReference _usersCollectionReferece =
      Firestore.instance.collection('users');

  // Create User
  Future createUser(User user) async {
    try {
      await _usersCollectionReferece.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  // 유저 정보 가져오기. 가져와서 data를 User class로 return 한다.
  Future getUser(String uid) async {
    try {
      print(uid);
      var userData = await _usersCollectionReferece.document(uid).get();
      print(User.fromData(userData.data).email);
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  // CREATE
  // Future createAtDB(
  //     {@required String collection,
  //     @required String document,
  //     @required Map<String, dynamic> setDataMap}) async {
  //   _db.collection(collection).document(document).setData(setDataMap);
  // }

  // READ
  // Future readFromDB({
  //   @required String collection,
  //   @required String document,
  // }) async {
  //   _db.collection(collection)({

  //   })
  // }
  // UPDATE

  // DELETE

}
