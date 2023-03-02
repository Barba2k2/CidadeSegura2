import 'package:flutter/material.dart';
import '../../../../../../constants/colors_constants.dart';

class SendFormButton extends StatelessWidget {
  const SendFormButton({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPress,
        child: const Text(
          'Enviar',
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
