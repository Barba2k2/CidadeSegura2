import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../constants/colors_constants.dart';
import 'buttons/cancel_button.dart';
import 'buttons/send_form_button.dart';
import 'widgets/modal_alert.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nomeController = TextEditingController(); //Armazena variavel de Texto
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _pontoReferenciaController = TextEditingController();
  final _descricaoController = TextEditingController();

  final _formKey = GlobalKey<
      FormState>(); //Cria uma chave global para acessar o estado do formulário
  final _formData = <String,
      Object>{}; //Cria um mapa vazio que será usado para armazenar os dados do formulário.

  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; //Cria uma instância do Firestore, para interagir com o banco de dados Firestore do Firebase.

  //Salva os dados do formulario no subcolection 'chamados' dentro do documento do usuário no Firestore
  void saveData(String name, String telefone, String endereco, String bairro,
      String cidade, String pontoReferencia, String descricao) {
    CollectionReference users = _firestore.collection('Users');
    DocumentReference userDocRef = users.doc('user_id');
    CollectionReference chamados = userDocRef.collection('chamados');

    chamados
        .add({
          'name': name,
          'telefone': telefone,
          'endreço': endereco,
          'bairro': bairro,
          'cidade': cidade,
          'ponto de referencia': pontoReferencia,
          'descrição': descricao,
        })
        //Mostra no console se os dados foram salvos ou se ocorreu um erro
        .then((value) => debugPrint("Dados salvos com sucesso!"))
        .catchError((error) => debugPrint("Falha ao salvar dados: $error"));
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'NOVO CHAMADO',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome do Solicitante',
                      helperText: 'Seu nome é muito importante!',
                      hintText: 'João Da Silva Pedreira',
                      prefixIcon: Icon(Icons.person_rounded,
                          color: isDark ? white : black),
                      hoverColor: black,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: isDark
                              ? isDark
                                  ? white
                                  : black
                              : black),
                    ),
                    controller: _nomeController,
                    textInputAction: TextInputAction.next,
                    minLines: 1,
                    maxLines: null,
                    style: TextStyle(color: isDark ? white : black),
                    // validator: (value) {
                    //   if (value!.trim().isEmpty || value.length < 4) {
                    //     return 'Por favor insira o nome';
                    //   } else if (value.length < 4) {
                    //     return 'Nome precisa ter 4 ou mais letras';
                    //   }
                    //   return null;
                    // },
                    onSaved: (name) => _formData['name'] = name.toString(),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      helperText: 'Seu telefone tambem é importante!',
                      hintText: '(11) 93551-1525',
                      prefixIcon: Icon(Icons.phone_sharp,
                          color: isDark ? white : black),
                      hoverColor: Colors.red,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Por favor insira o telefone';
                    //   }
                    //   return null;
                    // },
                    controller: _telefoneController,
                    onSaved: (telefone) =>
                        _formData['telefone'] = double.parse(telefone ?? ''),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Endereço',
                      hintText: 'Rua Augusta, 55',
                      prefixIcon: Icon(Icons.add_road_sharp,
                          color: isDark ? white : black),
                      hoverColor: whiteGrey,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    textInputAction: TextInputAction.next,
                    minLines: 1,
                    maxLines: null,
                    controller: _enderecoController,
                    onSaved: (endereco) =>
                        _formData['Endereço'] = endereco ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bairro',
                      hintText: 'Jardim Anápolis',
                      prefixIcon: Icon(Icons.location_city_sharp,
                          color: isDark ? white : black),
                      hoverColor: whiteGrey,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    textInputAction: TextInputAction.next,
                    minLines: 1,
                    maxLines: null,
                    // validator: (value) {
                    //   return null;
                    // },
                    controller: _bairroController,
                    onSaved: (bairro) => _formData['bairro'] = bairro ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cidade',
                      hintText: 'São Paulo',
                      prefixIcon: Icon(Icons.account_balance_sharp,
                          color: isDark ? white : black),
                      hoverColor: whiteGrey,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    textInputAction: TextInputAction.next,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Por favor insira a cidade';
                    //   }
                    //   return null;
                    // },
                    controller: _cidadeController,
                    onSaved: (cidade) => _formData['Cidade'] = cidade ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ponto de Referencia',
                      hintText: 'Boteko do Seu Zézinho',
                      prefixIcon: Icon(Icons.add_business_sharp,
                          color: isDark ? white : black),
                      hoverColor: whiteGrey,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    textInputAction: TextInputAction.next,
                    minLines: 1,
                    maxLines: null,
                    // validator: (value) {
                    //   return null;
                    // },
                    controller: _pontoReferenciaController,
                    onSaved: (pontoReferencia) =>
                        _formData['Ponto de Referencia'] =
                            pontoReferencia ?? '',
                  ),
                  const SizedBox(height: 10), //Espaçamento
                  TextFormField(
                    //Cria um campo de texto com uma dica (hintText) e um rótulo (labelText) para que o usuário possa inserir a descrição do problema.
                    decoration: InputDecoration(
                      labelText: 'Descrição do problema', //Rotúlo
                      hintText: 'Luz do poste queimada', //Dica de texto
                      //Muda a cor do icone de acordo com o tema do dispositivo do usuario
                      prefixIcon:
                          Icon(Icons.abc_sharp, color: isDark ? white : black),
                      hoverColor: whiteGrey,
                      focusedBorder: const OutlineInputBorder(
                        //Define o estilo da borda do campo selecionado
                        borderSide: BorderSide(
                          width: 2, //Grossura da borda
                          color: Colors.greenAccent, //Cor da borda
                        ),
                        borderRadius: BorderRadius.only(
                          //Define os parametros da borda
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        //Define o estilo da borda do campo de texto
                        borderRadius: BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      labelStyle: TextStyle(color: isDark ? white : black),
                    ),
                    minLines: 1, //Define o minimo de linhas do campo de texto
                    maxLines:
                        null, //Permite que expanda conforme o ususario introduz o texto
                    //Valida o se o campo está vazio, se vazio pede ao usuario que insira um texto
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor insira a descrição';
                      }
                      return null;
                    },
                    controller: _descricaoController,
                    onSaved: (description) =>
                        _formData['description'] = description ?? '',
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SendFormButton(
                        //Widget personalizado para o Botão enviar
                        onPress: () {
                          saveData(
                            _nomeController.text,
                            _telefoneController.text,
                            _enderecoController.text,
                            _bairroController.text,
                            _cidadeController.text,
                            _pontoReferenciaController.text,
                            _descricaoController.text,
                          );
                          Navigator.pop(context);

                          const ModalAlert();

                          debugPrint('Dados enviados');
                        },
                      ),
                      const CancelButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
