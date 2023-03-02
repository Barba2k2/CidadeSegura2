import 'package:cidade_segura2/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 5));
    Get.to(const WelcomeScreen());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
}
