class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'Um erro desconhecido ocorreu.']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Por favor, coloque uma senha mais forte.',
        );
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'E-mail invalido ou mal formatado.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'Uma conta com este endereço de e-mail ja existe.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operação não permitida. Por favor contate o suporte.',
        );
      case 'user-disable':
        return const SignUpWithEmailAndPasswordFailure(
          'Este usuário foi desativado. Por favor entre em contato com o suporte para obter ajuda.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
