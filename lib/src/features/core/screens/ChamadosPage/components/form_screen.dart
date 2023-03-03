import 'dart:async';
import 'package:cidade_segura2/src/features/core/screens/ChamadosPage/components/database/form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../constants/text_strings.dart';
import 'buttons/cancel_button.dart';
import 'buttons/send_form_button.dart';
import 'dados_form.dart';
import 'form_controller.dart';

class FormScreen extends StatefulWidget {
  final Function(DadosForm)? onSubmit;

  const FormScreen({super.key, this.onSubmit});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _pontoReferenciaController = TextEditingController();
  final _descricaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  @override
  Widget build(BuildContext context) {
    final forms = Provider.of<FormRepository>(context);
    // formulario = context.watch<FormRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOVO CHAMADO',
          style: TextStyle(fontWeight: semiBold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
                  decoration: const InputDecoration(
                    labelText: 'Nome do Solicitante',
                    helperText: 'Seu nome é muito importante!',
                    hintText: 'João Da Silva Pedreira',
                    prefixIcon: Icon(Icons.person_rounded, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                  ),
                  controller: _nomeController,
                  textInputAction: TextInputAction.next,
                  minLines: 1,
                  maxLines: null,
                  style: const TextStyle(color: white),
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
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    helperText: 'Seu telefone tambem é importante!',
                    hintText: '(11) 93551-1525',
                    prefixIcon: Icon(Icons.phone_sharp, color: white),
                    hoverColor: Colors.red,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
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
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                    hintText: 'Rua Augusta, 55',
                    prefixIcon: Icon(Icons.add_road_sharp, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                  ),
                  textInputAction: TextInputAction.next,
                  minLines: 1,
                  maxLines: null,
                  controller: _enderecoController,
                  onSaved: (endereco) => _formData['Endereço'] = endereco ?? '',
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bairro',
                    hintText: 'Jardim Anápolis',
                    prefixIcon: Icon(Icons.location_city_sharp, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
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
                  decoration: const InputDecoration(
                    labelText: 'Cidade',
                    hintText: 'São Paulo',
                    prefixIcon: Icon(Icons.account_balance_sharp, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
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
                  decoration: const InputDecoration(
                    labelText: 'Ponto de Referencia',
                    hintText: 'Boteko do Seu Zézinho',
                    prefixIcon: Icon(Icons.add_business_sharp, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                  ),
                  textInputAction: TextInputAction.next,
                  minLines: 1,
                  maxLines: null,
                  // validator: (value) {
                  //   return null;
                  // },
                  controller: _pontoReferenciaController,
                  onSaved: (pontoReferencia) =>
                      _formData['Ponto de Referencia'] = pontoReferencia ?? '',
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descrição do problema',
                    hintText: 'Luz do poste queimada',
                    prefixIcon: Icon(Icons.abc_sharp, color: white),
                    hoverColor: whiteGrey,
                    focusedBorder: OutlineInputBorder(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.zero,
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    labelStyle: TextStyle(color: white),
                  ),
                  minLines: 1,
                  maxLines: null,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Por favor insira a descrição';
                  //   }
                  //   return null;
                  // },
                  controller: _descricaoController,
                  onSaved: (description) =>
                      _formData['description'] = description ?? '',
                ),
                // -- Widgets para enviar foto e vídeo
                // const SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const EnviarFotoGaleria(),
                //       const EnviarFotoCamera(),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SendFormButton(
                      onPress: () {
                        // FormController().submitForm(
                        //   _nomeController.text,
                        //   _telefoneController.text,
                        // );
                        // Navigator.pop(context);
                        // buildShowDialog(context);

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
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              tClose,
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
      ),
    );
  }
}
