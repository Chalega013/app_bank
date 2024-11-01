bool isValidCPF(String cpf) {
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
int _calculateCheckDigit(List<int> digits) {
  int sum = 0;
  for (int i = 0; i < digits.length; i++) {
    sum += digits[i] * (digits.length + 1 - i);
  }
  int mod = sum % 11;
  return mod < 2 ? 0 : 11 - mod;
}

// Teste da função
void main() {
  String cpf = "123.456.789-09"; // Exemplo de CPF
  if (isValidCPF(cpf)) {
    print("CPF é válido");
  } else {
    print("CPF é inválido");
  }
}
