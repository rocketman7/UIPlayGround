import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  Firestore _db = Firestore.instance;

  // CREATE
  Future createAtDB(
      {@required String collection,
      @required String document,
      @required Map<String, dynamic> setDataMap}) async {
    _db.collection(collection).document(document).setData(setDataMap);
  }

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
