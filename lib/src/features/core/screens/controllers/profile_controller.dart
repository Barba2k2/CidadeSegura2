import 'package:cidade_segura2/src/repositories/authentication_repository/authentication_repository.dart';
import 'package:cidade_segura2/src/repositories/user_repository/user_repository.dart';
import 'package:get/get.dart';
import '../../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get User Email and Password to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Erro', 'Entre para continuar');
    }
  }

  // Fetch List of users records.
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
