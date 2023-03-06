import 'package:flutter/material.dart';

//Classe base para montar e personalizar o Header(cabeçalho) do formulario de Login e Cadastro

class FormHEaderWidgte extends StatelessWidget {
  const FormHEaderWidgte({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    //Função required obriga a adionar a variavel
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    //Função usada para obter o tamanho da tela do dispositivo em que o aplicativo está sendo executado
    final size = MediaQuery.of(context).size;
    return Column(
      //Alinhamento do widget no eixo vertical
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Define a imagem e o tamanho dela
        Image(image: AssetImage(image), height: size.height * 0.2),

        //Funções para definir titulo e subtitulo e sesu respectivos tamamnhos
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
