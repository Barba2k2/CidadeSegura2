import 'package:cidade_segura2/src/constants/sizes.dart';
import 'package:cidade_segura2/src/constants/text_strings.dart';
import 'package:cidade_segura2/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tOtpTitle,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  tOtpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 40),
                const Text(
                  '$tOtpMessage barba07@gmail.com',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.2),
                  filled: true,
                  onSubmit: (code) {
                    debugPrint('OTP Code: $code');
                    otp = code;
                    OTPController.instance.verifyOTP(otp);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      OTPController.instance.verifyOTP(otp);
                    },
                    child: const Text(tNext),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
