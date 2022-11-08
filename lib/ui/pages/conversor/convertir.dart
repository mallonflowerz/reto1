import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  List<List<double>> factor = [
    [1, 5000, 5000],
    [0.00025, 1, 1],
    [0.0002, 0.8, 1]
  ];

  bool copO = false;
  bool eurO = false;
  bool dolO = false;

  bool copD = false;
  bool eurD = false;
  bool dolD = false;

  TextEditingController divA = TextEditingController(text: "0.0");
  TextEditingController divB = TextEditingController(text: "0.0");

  int indO = 0;
  int indD = 0;

  void cambiarestadoO(String moneda) {
    if (moneda == "COP") {
      copO = copO ? false : true;
      if (copO == true) {
        dolO = false;
        eurO = false;
        indO = 0;
      }
    } else if (moneda == "DOL") {
      dolO = dolO ? false : true;
      if (dolO == true) {
        copO = false;
        eurO = false;
        indO = 1;
      }
    } else if (moneda == "EUR") {
      eurO = eurO ? false : true;
      if (eurO == true) {
        copO = false;
        dolO = false;
        indO = 2;
      }
    }
    conversion();
    setState(() {});
  }

  void cambiarestadoD(String moneda) {
    if (moneda == "COP") {
      copD = copD ? false : true;
      if (copD == true) {
        dolD = false;
        eurD = false;
        indD = 0;
      }
    } else if (moneda == "DOL") {
      dolD = dolD ? false : true;
      if (dolD == true) {
        copD = false;
        eurD = false;
        indD = 1;
      }
    } else if (moneda == "EUR") {
      eurD = eurD ? false : true;
      if (eurD == true) {
        copD = false;
        dolD = false;
        indD = 2;
      }
    }
    conversion();
    setState(() {});
  }

  void valores(String press) {
    if (divA.text == "0.0") divA.clear();
    divA.text = divA.text + press;
    conversion();
  }

  void conversion() {
    double valorO = double.parse(divA.text);
    print(factor[indD][indO]);
    divB.text = (valorO * factor[indD][indO]).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversor de Monedas - Equipo 5 - NCR2290',
          style: TextStyle(
            fontFamily: "Agency FB",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            const Text('Valor a Convertir'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => cambiarestadoO("COP"),
                  child: Monedas(moneda: copO, texto: "COP"),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO("EUR"),
                  child: Monedas(moneda: eurO, texto: "EUR"),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO("DOL"),
                  child: Monedas(moneda: dolO, texto: "DOL"),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center, //alineacion del texto
              controller: divA,
              decoration: const InputDecoration(
                  hintText: '0.0'), // Valor por defecto cuando no hay datos
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Conversion"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => cambiarestadoD("COP"),
                  child: Monedas(moneda: copD, texto: "COP"),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD("EUR"),
                  child: Monedas(moneda: eurD, texto: "EUR"),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD("DOL"),
                  child: Monedas(moneda: dolD, texto: "DOL"),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: divB,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() => valores("7")),
                  child: const Botones(
                    valor: '7',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("8")),
                  child: const Botones(
                    valor: '8',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("9")),
                  child: const Botones(
                    valor: '9',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onLongPress: () => valores("4"),
                  onTap: (() => valores("4")),
                  child: const Botones(
                    valor: '4',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("5")),
                  child: const Botones(
                    valor: '5',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("6")),
                  child: const Botones(
                    valor: '6',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() => valores("1")),
                  child: const Botones(
                    valor: '1',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("2")),
                  child: const Botones(
                    valor: '2',
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("3")),
                  child: const Botones(
                    valor: '3',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() => valores(".")),
                  child: const Botones(
                    valor: ".",
                  ),
                ),
                GestureDetector(
                  onTap: (() => valores("0")),
                  child: const Botones(
                    valor: '0',
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    divA.text = "0.0";
                    divB.text = "0.0";
                  }),
                  child: const Botones1(
                    valor: "RESET",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Monedas extends StatelessWidget {
  const Monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: Text(texto),
        backgroundColor: moneda ? Colors.blueGrey : Colors.grey,
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String valor;
  const Botones({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            color: Color.fromARGB(255, 148, 148, 148)),
        width: 80,
        height: 80,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}

class Botones1 extends StatelessWidget {
  final String valor;
  const Botones1({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            color: Color.fromARGB(255, 148, 148, 148)),
        width: 80,
        height: 80,
        child: Center(
            child: Text(
          valor,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Bauhaus 93 Normal"),
        )),
      ),
    );
  }
}
