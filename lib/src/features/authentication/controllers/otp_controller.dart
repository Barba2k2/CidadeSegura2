import 'package:get/get.dart';
import '../../../repositories/authentication_repository/authentication_repository.dart';
import '../../core/bottom_nav_bar.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const BottomNavBar()) : Get.back();
  }
}
