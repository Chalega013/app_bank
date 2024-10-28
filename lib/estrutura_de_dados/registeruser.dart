import 'package:flutter/material.dart';
import 'package:flutter_application_1/estrutura_de_dados/User.dart';
import 'package:flutter_application_1/estrutura_de_dados/database_helper.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _cpfController = TextEditingController();
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

  print("Registrando CPF: $cpf"); // Adicione esta linha
  User newUser = User(cpf: cpf, senha: senha);
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
