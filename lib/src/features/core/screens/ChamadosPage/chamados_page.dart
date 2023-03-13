import 'package:cidade_segura2/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/form_screen.dart';

//Tipo de widget que pode ter seu estado alterado durante a execução do aplicativo
class ChamadosPage extends StatefulWidget {
  const ChamadosPage({Key? key}) : super(key: key);

  @override
  _ChamadosPageState createState() => _ChamadosPageState();
}

class _ChamadosPageState extends State<ChamadosPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chamados criados',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.transparent, //Define uma cor a AppBar
        elevation: 0, //Profundidade em relção aos demais elementos (Eixo Z)
        automaticallyImplyLeading: false, //Oculta e bloqueia a opção voltar
        centerTitle: true, //Centraliza o texto da AppBar (Por padrão e 'false' no Android e 'true' no iOs)
      ),
      //Botao Flutuante
      floatingActionButton: FloatingActionButton(
        //Função do botao ao ser apertado
        onPressed: () {
          //Redirionamento de pagina
          Get.to(const FormScreen()); 
        },
        elevation: 0,
        backgroundColor: tPrimaryColor, //Cor de fundo do botão
        //O 'const' é usado para declarar constantes durante a compilação
        child: const Icon(Icons.add_outlined, size: 35), //Difine um desenho(icone) dentro do botão
      ),
      //Posição do botão
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat, //Pequeno e 'flutuante'
      //Corpo da Scaffold
      body: SingleChildScrollView( //Perimite a rolagem na pagina evitando overflow
        child: Column( //Coluna onde serao exibidos os dados
          children: [
            TextButton( //Botao em forma de texto
              onPressed: () {
                setState(() {
                  number = number + 1;
                });
              },
              child: Text(
                'Add Tile',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListView.builder( //Contrutor para Widgets em Lista
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return ListTile( //Exibe dados de uma Widget em Lista
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit, color: Colors.yellow),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    'Exemplo 1',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
              itemCount: number,
            ),
          ],
        ),
      ),
    );
  }
}
