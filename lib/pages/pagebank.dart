import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/perfiluser.dart';

class Pagebank extends StatefulWidget {
  const Pagebank({super.key});

  @override
  _PagebankState createState() => _PagebankState();
}

class _PagebankState extends State<Pagebank> {
  bool _isEyeOpen = true; // Estado do ícone do olho

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 110, 18, 150),
                padding: const EdgeInsets.all(85),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Conta',
                      style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
                style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 6.5, right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [BoxShadow(color: Colors.black26)],
                ),
                child: const Row(
                  children: [
                    Text(
                      "R\$ 1.234,56",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCircularButton("Pix", Icons.pix),
                    _buildCircularButton("Pagar", Icons.payment),
                    _buildCircularButton("Transferir", Icons.transfer_within_a_station),
                    _buildCircularButton("Depositar", Icons.attach_money),
                    _buildCircularButton("Empréstimo", Icons.monetization_on),
                    _buildCircularButton("Recarga", Icons.phone_android),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Positioned(
                left: 20,
                bottom: 100,
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 0.5)],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.credit_card, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              'Meus Cartões',
                              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildRectangularButton("Você tem", "25.000 disponíveis para", "empréstimo",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                    _buildRectangularButton("Do trabalho", "Até o show da sua vida", "Nubank seguro celular",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                    _buildRectangularButton("Bora receber pagamentos do cartão", "com seu celular? Conheça o", "NuTap",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                    _buildRectangularButton("Conheça Nubank vida:", "Seguro e simples", "Cabe no seu bolso",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                    _buildRectangularButton("Shopping:", "Não perca nossas ofertas!", "Venha conhecer",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 370,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 0.5)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.credit_card, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                "Cartão de crédito",
                                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              SizedBox(height: 9),
                              Text(
                                "Fatura atual: R\$ 2.000",
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                              ),
                              Text(
                                "Limite disponível: R\$ 1.200",
                                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 115, left: 20),
            child: const Text(
              "Olá, Guilherme",
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 26,
            left: 15,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("←"),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 253, 251, 255),
                backgroundColor: const Color.fromARGB(255, 110, 18, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 5,
              ),
            ),
          ),
          Positioned(
            top: 26,
            right: 4,
            child: Row(
              children: [
                _buildEyeButton(), // Botão do olho
                const SizedBox(width: 8),
                _buildMiniButton(Icons.notifications),
                const SizedBox(width: 8),
                _buildMiniButton(Icons.account_circle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEyeButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isEyeOpen = !_isEyeOpen; // Alterna o estado do olho
        });
      },
      child: Icon(_isEyeOpen ? Icons.visibility : Icons.visibility_off, size: 20, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Widget _buildMiniButton(IconData icon) {
    return ElevatedButton(
      onPressed: () {
        if (icon == Icons.account_circle) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PerfilPage()),
          );
        }
      },
      child: Icon(icon, size: 20, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Widget _buildCircularButton(String label, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: SizedBox(
              width: 57,
              height: 57,
              child: Icon(iconData, size: 24, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildRectangularButton(String line1, String line2, String line3, {TextStyle? textStyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 0.5),
          ],
        ),
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                line1,
                style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                line2,
                style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                line3,
                style: textStyle ?? const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
    );
  }
}
