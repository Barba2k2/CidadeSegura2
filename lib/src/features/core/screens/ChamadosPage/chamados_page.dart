import 'package:cidade_segura2/src/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/dados_form.dart';
import 'components/form_screen.dart';

class ChamadosPage extends StatefulWidget {
  final DadosForm? formData;

  const ChamadosPage({Key? key, this.formData}) : super(key: key);

  @override
  _ChamadosPageState createState() => _ChamadosPageState();
}

class _ChamadosPageState extends State<ChamadosPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chamados criados',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const FormScreen());
        },
        elevation: 0,
        backgroundColor: tPrimaryColor,
        child: const Icon(Icons.add_outlined, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
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
            ListView.builder(
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return ListTile(
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
