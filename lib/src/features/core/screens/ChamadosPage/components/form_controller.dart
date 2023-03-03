// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class FormController {
//   final CollectionReference _formCollection =
//       FirebaseFirestore.instance.collection('usuarios/${usuario!.uid}');

//   Future<void> submitForm(String name, String telefone) async {
//     try {
//       await _formCollection.add({
//         'name': name,
//         'telefone': telefone,
//       });
//       debugPrint('Formulário enviado com sucesso!');
//     } catch (e) {
//       debugPrint('Erro ao enviar formulário: $e');
//     }
//   }
// }
