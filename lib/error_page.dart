import 'package:flutter/material.dart';
import 'src/constants/text_strings.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('ERROR', style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Alinhamento do widget no eixo horizontal
          children: [ //Especifica Widgets Filhos
            Center(
              child: Text(
                'Um erro inesperado aconteceu, volte e tente novamente!',
                textAlign: TextAlign.center, //Alinhamento do texto
                style: Theme.of(context).textTheme.displayLarge, //Define um estilo de texto de acordo com o contexto
              ),
            ),
            const SizedBox(height: 15), //Se vazia usada para espaçar Widgets
            SizedBox( //Nesse caso, usada para definir um tamanho vertical para o botao
              width: 150,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context), //Usada para navegar de volta para a tela anterior na hierarquia de telas
                child: Text(
                  tBack.toUpperCase(), //tBack = String predefinida em outra classe 
                  //toUpperCase = Deixa o texto em caixa alta
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
