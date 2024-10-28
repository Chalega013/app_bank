class User {
   int? id;           // ID do usuário
  String? cpf;       // CPF do usuário
   String? senha;     // Senha do usuário

  User({this.id, required this.cpf, required this.senha});

  User.fromMap(Map<String , dynamic> map) {
    id = map["id"];
    cpf = map["cpf"];
    senha = map["senha"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "cpf": cpf,
      "senha": senha,
    };
  }

  static final List<String> columns = ["id", "cpf", "senha"];

  // Validação do CPF (formato básico)
  static bool isValidCPF(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    // Verifica se o CPF tem 11 dígitos
    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

    // Cálculo dos dígitos verificadores
    List<int> digits = cpf.split('').map(int.parse).toList();
    int firstCheck = _calculateCheckDigit(digits.sublist(0, 9));
    int secondCheck = _calculateCheckDigit(digits.sublist(0, 10));

    return firstCheck == digits[9] && secondCheck == digits[10];
  }

  // Cálculo do dígito verificador
  static int _calculateCheckDigit(List<int> digits) {
    int sum = 0;
    for (int i = 0; i < digits.length; i++) {
      sum += digits[i] * (digits.length + 1 - i);
    }
    int mod = sum % 11;
    return mod < 2 ? 0 : 11 - mod;
  }

  // Método para atualizar a senha
  void updatePassword(String newPassword) {
    senha = newPassword;
  }
  
}

