import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  double numero1 = 0;
  double numero2 = 0;

  String resultado = '0';

  void somar() {
    setState(() {
      resultado = (numero1 + numero2).toString();
    });
  }

  void subtrair() {
    setState(() {
      resultado = (numero1 - numero2).toString();
    });
  }

  void multiplicar() {
    setState(() {
      resultado = (numero1 * numero2).toString();
    });
  }

  void dividir() {
    setState(() {
      if (numero2 == 0) {
        resultado = 'Não é possível dividir por zero';
      } else {
        resultado = (numero1 / numero2).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                numero1 = double.tryParse(
                      valor.replaceAll(',', '.'),
                    ) ??
                    0;
              },
            ),

            const SizedBox(height: 20),

            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                numero2 = double.tryParse(
                      valor.replaceAll(',', '.'),
                    ) ??
                    0;
              },
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: somar,
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: subtrair,
                  child: const Text('-'),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: multiplicar,
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: dividir,
                  child: const Text('÷'),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Resultado:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}