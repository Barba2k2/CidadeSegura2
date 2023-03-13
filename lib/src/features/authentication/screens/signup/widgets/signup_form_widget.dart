import 'package:cidade_segura2/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../constants/text_strings.dart';
import '../../../models/user_model.dart';
import '../../../services/google_login_service.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                // label: const Text(tFullName),
                labelText: tLabelName,
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, insira o email.';
                }
                return null;
              },
              controller: controller.email,
              decoration: const InputDecoration(
                // label: Text(tEmail),
                labelText: tLabelEmail,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                labelText: tLabelNumber,
                // label: const Text(tPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '+## (##) # ####-####',
                  filter: {
                    "#": RegExp(r'[0-9]'),
                  },
                ),
                // outras formatações, se necessário
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, insira uma senha.';
                } else if (value.length <= 6) {
                  return 'A senha deve conter 7 ou mais caracteres.';
                }
                return null;
              },
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // -- Email Authentication
                  if (_formKey.currentState!.validate()) {
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                  }

                  // -- Phone Authentication
                  SignUpController.instance.phoneAuthentication(
                    controller.phoneNo.text.trim(),
                  );

                  final user = UserModel(
                    email: controller.email.text.trim(),
                    password: controller.password.text.trim(),
                    fullName: controller.fullName.text.trim(),
                    phoneNo: controller.phoneNo.text.trim(),
                  );
                  SignUpController.instance.createUser(user);
                },
                child: Text(tSingup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
