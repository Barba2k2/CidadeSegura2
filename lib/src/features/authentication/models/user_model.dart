import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      'Nome Completo': fullName,
      'E-mail': email,
      'Telefone': phoneNo,
      'Senha': password,
    };
  }

  /// -- Map User fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['Email'],
      password: data['Password'],
      fullName: data['FullName'],
      phoneNo: data['Phone'],
    );
  }
}
