import 'package:flutter/material.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../chamados_page.dart';

class BotaoEnviar extends StatelessWidget {
  const BotaoEnviar({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChamadosPage(),
            ),
          );
        }
      },
      child: const Text(
        'Enviar',
        style: TextStyle(
          fontWeight: semiBold,
          fontSize: 16,
          color: white,
        ),
      ),
    );
  }
}
