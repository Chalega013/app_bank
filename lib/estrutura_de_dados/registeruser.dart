import 'package:flutter/material.dart';
import 'package:flutter_application_1/estrutura_de_dados/User.dart';
import 'package:flutter_application_1/estrutura_de_dados/Valida%C3%A7%C3%A3o_cpf.dart';
import 'package:flutter_application_1/estrutura_de_dados/database_helper.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Declarando o tipo explicitamente como MaskedTextController
  final MaskedTextController _cpfController = MaskedTextController(mask: '000.000.000-00');
  final TextEditingController _senhaController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _registerUser() async {
    String cpf = _cpfController.text;
    String senha = _senhaController.text;

    if (cpf.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CPF e Senha são obrigatórios")),
      );
      return;
    }

    // Verifica se o CPF é válido removendo a máscara antes da validação
    if (!isValidCPF(cpf.replaceAll(RegExp(r'\D'), ''))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CPF inválido")),
      );
      return;
    }

    print("Registrando CPF: $cpf");
    // Remove a máscara do CPF antes de salvar no banco de dados
    User newUser = User(cpf: cpf.replaceAll(RegExp(r'\D'), ''), senha: senha);
    await _databaseHelper.addUser(newUser);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuário registrado com sucesso!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Usuário")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: "CPF"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
            ),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
