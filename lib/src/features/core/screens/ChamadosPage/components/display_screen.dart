// import 'package:flutter/material.dart';
// import 'dados_form.dart';

// class DisplayScreen extends StatefulWidget {
//   final DadosForm? formData;

//   const DisplayScreen({
//     Key? key,
//     this.formData,
//   }) : super(key: key);

//   @override
//   State<DisplayScreen> createState() => _DisplayScreenState();
// }

// class _DisplayScreenState extends State<DisplayScreen> {
//   late Map<String, dynamic> _data;

//   late String nome;
//   late String telefone;
//   late String endereco;
//   late String bairro;
//   late String cidade;
//   late String pontoReferencia;
//   late String descricao;

//   @override
//   void initState() {
//     _data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     super.initState();
//     if (_data != null) {
//       nome = _data['nome'];
//       telefone = _data['Telefone'];
//       endereco = _data['Endereço'];
//       bairro = _data['Bairro'];
//       cidade = _data['Cidade'];
//       pontoReferencia = _data['Ponto de Referencia'];
//       descricao = _data['Descrição'];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ExpansionPanelList.radio(
//           expansionCallback: (int index, bool isExpanded) {
//             setState(() => _data[index].isExpanded = !isExpanded);
//           },
//           children: [
//             _data.map<ExpansionPanel>((DadosForm formData) {
//               return ExpansionPanelRadio(
//                 value: formData,
//                 canTapOnHeader: true,
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return ListTile(
//                     leading: Text(formData.index.toString()),
//                   );
//                 },
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     ListTile(
//                       title: Text('Nome: $nome'),
//                     ),
//                     ListTile(
//                       title: Text('Telefone: $telefone'),
//                     ),
//                     ListTile(
//                       title: Text('Endereço: $endereco'),
//                     ),
//                     ListTile(
//                       title: Text('Bairro: $bairro'),
//                     ),
//                     ListTile(
//                       title: Text('Cidade: $cidade'),
//                     ),
//                     ListTile(
//                       title: Text('Ponto de Referência: $pontoReferencia'),
//                     ),
//                     ListTile(
//                       title: Text('Descrição: $descricao'),
//                     ),
//                   ],
//                 ),
//               );
//             } as MapEntry Function(String key, dynamic value)).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
