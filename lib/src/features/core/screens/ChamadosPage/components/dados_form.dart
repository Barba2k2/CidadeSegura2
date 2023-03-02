// Classe para armazenar informações do formulário
class DadosForm {

  final String nome;
  final String telefone;
  final String endereco;
  final String bairro;
  final String cidade;
  final String pontoReferencia;
  final String descricao;

  DadosForm({
    required this.nome,
    required this.telefone,
    required this.endereco,
    required this.bairro,
    required this.cidade,
    required this.pontoReferencia,
    required this.descricao,
  });

  toJson() {
    return {
      'Nome do Solicitante' : nome,
      'Telefone' : telefone,
      'Endereco' : endereco,
      'Bairro' : bairro,
      'Cidade' : cidade,
      'PontoReferencia' : pontoReferencia,
      'Descricao' : descricao,
    };
  }
}
