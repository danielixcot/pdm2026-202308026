import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color.fromARGB(255, 249, 249, 249);
const kSuperficie = Color.fromARGB(255, 230, 231, 229);
const kBorde = Color(0xFF2A3222);
const kColorLetra = Color.fromARGB(255, 0, 0, 0);
const kColorTextoTarjeta = Color.fromARGB(255, 0, 0, 0);
const kMuted = Color.fromARGB(255, 174, 181, 167);
const kLima = Color(0xFFC8F54E);
const kgris = Color.fromARGB(255, 99, 101, 96);
const knegro = Color.fromARGB(255, 0, 0, 0);
const kIconoFondo = Color.fromARGB(255, 99, 101, 96);

const kFig = TextStyle(fontFamily: 'monospace');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pantalla2',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kFondo,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kSuperficie,
                      border: Border.all(color: kBorde, width: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add money',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: kColorLetra,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                'Select card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kColorLetra,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    tarjetaCard(
                      seleccionada: true,
                      fondo: kLima,
                      etiqueta: 'Debit card',
                      numero: '•••• 4568',
                      marca: null,
                    ),
                    const SizedBox(width: 12),
                    tarjetaCard(
                      seleccionada: false,
                      fondo: knegro,
                      etiqueta: 'Credit card',
                      numero: '•••• 2478',
                      marca: 'VISA',
                    ),
                    const SizedBox(width: 12),
                    tarjetaCard(
                      seleccionada: false,
                      fondo: kgris,
                      etiqueta: 'Bank card',
                      numero: '•••• 9021',
                      marca: null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Add money to Neobanck',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kColorLetra,
                ),
              ),
              const SizedBox(height: 16),
              opcionAgregarDinero(Icons.attach_money, 'Move your direct deposit'),
              const SizedBox(height: 10),
              opcionAgregarDinero(Icons.sync_alt, 'Transfer from other banks'),
              const SizedBox(height: 10),
              opcionAgregarDinero(Icons.phone_iphone, 'Apple Pay'),
              const SizedBox(height: 10),
              opcionAgregarDinero(Icons.credit_card, 'Debit / Credit Card'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tarjetaCard({
  required bool seleccionada,
  required Color fondo,
  required String etiqueta,
  required String numero,
  required String? marca,
}) {
  return Container(
    width: 130,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: fondo,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: seleccionada
            ? Colors.black
            : const Color.fromARGB(255, 237, 239, 234),
        width: seleccionada ? 3 : 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: seleccionada
                    ? Border.all(color: Colors.black, width: 7)
                    : null,
              ),
            ),
            if (marca != null)
              Text(
                marca,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kFondo,
                ),
              ),
          ],
        ),
        const Spacer(),
        Text(
          etiqueta,
          style: const TextStyle(
            fontSize: 11,
            color: Color.fromARGB(255, 139, 142, 135),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          numero,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    ),
  );
}

Widget opcionAgregarDinero(IconData icon, String titulo) {
  return Material(
    color: kSuperficie,
    borderRadius: BorderRadius.circular(14),
    child: InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              child: Icon(icon, color: Colors.black, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(fontSize: 14, color: kColorLetra),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black, size: 20),
          ],
        ),
      ),
    ),
  );
}