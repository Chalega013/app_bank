import 'package:flutter/material.dart';
import 'package:flutter_application_1/estrutura_de_dados/database_helper.dart';
import 'package:flutter_application_1/estrutura_de_dados/registeruser.dart';
import 'package:flutter_application_1/pages/pagebank.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper(); // Instância do DatabaseHelper

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
                "assets/R-removebg-preview.png",
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
                      builder: (context) => RegistrationPage(),
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
  String cpf = _cpfController.text;
  String senha = _senhaController.text;

  if (cpf.isEmpty || senha.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("CPF e Senha são obrigatórios")),
    );
  } else {
    print("Validando CPF: $cpf e Senha: $senha"); // Adiciona este print
    bool isValid = await _databaseHelper.validateUser(cpf, senha);

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Pagebank()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CPF e Senha incorretos")),
      );
    }
  }
}


      }

