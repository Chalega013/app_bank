import 'package:flutter/material.dart';
import 'package:flutter_application_1/estrutura_de_dados/database_helper.dart';
import 'package:flutter_application_1/estrutura_de_dados/registeruser.dart';
import 'package:flutter_application_1/pages/pagebank.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart'; // Importação do pacote

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _senhaController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper(); // Instância do DatabaseHelper
  final MaskedTextController _cpfController = MaskedTextController(mask: '000.000.000-00'); // Controlador com máscara para CPF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/R-removebg-preview.png", // Imagem do logo ou ícone
                height: 130,
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Text(
                "Login",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _cpfController,
              autofocus: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: _senhaController,
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () => _validarLogin(),
                child: const Text("Entrar"),
              ),
            ),
            const SizedBox(height: 8),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(), // Navegação para a página de registro
                    ),
                  );
                },
                child: const Text("Registrar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validarLogin() async {
    // Remove máscara para validar CPF
    String cpf = _cpfController.text.replaceAll('.', '').replaceAll('-', '');
    String senha = _senhaController.text;

    if (cpf.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CPF e Senha são obrigatórios")),
      );
    } else {
      print("Validando CPF: $cpf e Senha: $senha");
      bool isValid = await _databaseHelper.validateUser(cpf, senha);

      if (isValid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pagebank()), // Navegação para a página principal após login
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("CPF e Senha incorretos")),
        );
      }
    }
  }
}
