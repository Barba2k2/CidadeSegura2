import 'package:cidade_segura2/src/features/core/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../core/screens/HomePage/home_page.dart';
import '../../../services/google_login_service.dart';
import '../../signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20,
            ),
            onPressed: () async {
              signInWithGoogle();
              await Get.to(const BottomNavBar());
            },
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: const Text.rich(
            TextSpan(
              text: tAlreadyHaveAccount,
              children: [
                TextSpan(
                  text: tSingup,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
