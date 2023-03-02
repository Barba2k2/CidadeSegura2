import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../bottom_nav_bar.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Deseja sair sem enviar?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          'Cancelar',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(const BottomNavBar()),
                        child: Text(
                          'Sair',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: const Text(
          tCancel,
          style: TextStyle(
            fontWeight: semiBold,
            fontSize: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}
