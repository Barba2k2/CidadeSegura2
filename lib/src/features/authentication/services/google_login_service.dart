import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  // Realiza a autenticação com o Google
  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  // Cria as credenciais do usuário com o Google
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  // Realiza o login com o Firebase Auth
  final UserCredential userCredential = await _auth.signInWithCredential(credential);

  // Verifica se é um novo usuário e salva os dados no Firestore
  final User? user = userCredential.user;
  if (userCredential.additionalUserInfo!.isNewUser) {
    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'email': user!.email,
      'name': user.displayName,
      'photoURL': user.photoURL,
    });
  }

  return userCredential;
}
