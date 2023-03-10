import 'package:cidade_segura2/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Store User to Database
  Future<void> createUser(UserModel user) async {
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(
          () => () => Get.snackbar('Sucesso', 'Sua conta foi criada.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, StackTrace) {
      Get.snackbar('Erro', 'Algo saiu mal. Tente Novamente!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      debugPrint(error.toString());
    });
  }

  // Fetch All Users OR User Details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection('Users').get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection('Users').doc(user.id).update(user.toJson());
  }
}
