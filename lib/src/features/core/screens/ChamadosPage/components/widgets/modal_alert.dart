import 'package:flutter/material.dart';
import '../../../../../../constants/text_strings.dart';


class ModalAlert extends StatelessWidget {
  const ModalAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Exibe uma janela de diálogo modal com um título e conteúdo personalizáveis.
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            //Constante de texto definida em outra classe
            tClose,
            //Define um estilo personalizado ao texto, como tipo de fonte, tamanha e cor como abaixo
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
      title: Text(
        tThanks,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      content: Text(
        tDialogMessage,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
