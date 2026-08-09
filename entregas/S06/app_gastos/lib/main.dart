import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Colores
const kFondo = Color(0xFF0E120C);
const kSuperficie = Color(0xFF181E14);
const kSuperficie2 = Color(0xFF20271B);
const kBorde = Color(0xFF303A29);
const kTexto = Color(0xFFF1F4EA);
const kMuted = Color(0xFF8F9C80);
const kVerde = Color.fromARGB(255, 83, 151, 207);
const kVerdeOscuro = Color(0xFF37491C);
const kRojo = Color(0xFFE05252);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kVerde,
          brightness: Brightness.dark,
        ),
        fontFamily: 'monospace',
      ),
      home: const SaldoScreen(),
    );
  }
}

class SaldoScreen extends StatelessWidget {
  const SaldoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Porcentaje general utilizado.
    // 0.82 = 82%
    const double porcentajeGeneral = 0.82;

    // Color del saldo dependiendo del porcentaje utilizado.
    final Color colorSaldo =
        porcentajeGeneral > 0.70 ? kRojo : kVerde;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CGs',
                          style: TextStyle(
                            color: kVerde,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Control de gastos',
                          style: TextStyle(
                            color: kMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: kSuperficie2,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: kBorde,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: kTexto,
                        size: 22,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Fecha y calendario
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Control semanal',
                      style: TextStyle(
                        color: kTexto,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Botón de calendario
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: kVerde,
                        size: 18,
                      ),
                      label: const Text(
                        '07 - 08 - 2026',
                        style: TextStyle(
                          color: kTexto,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        backgroundColor: kSuperficie2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: kBorde,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Tarjeta de saldo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: kSuperficie,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: kBorde,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: kVerdeOscuro,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: kVerde,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Saldo restante',
                            style: TextStyle(
                              color: kMuted,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Saldo restante
                      Text(
                        'Q 590.00',
                        style: TextStyle(
                          color: kTexto,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: colorSaldo,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            porcentajeGeneral > 0.70
                                ? 'Has utilizado más del 70%'
                                : 'Disponible actualmente',
                            style: const TextStyle(
                              color: kMuted,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Botón registrar gasto
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 22,
                    ),
                    label: const Text(
                      'Registrar gasto',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kVerde,
                      foregroundColor: kFondo,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Resumen semanal
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: kSuperficie,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: kBorde,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: kSuperficie2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.trending_down,
                              color: kVerde,
                              size: 19,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gastado esta semana',
                                style: TextStyle(
                                  color: kMuted,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Q 410.00',
                                style: TextStyle(
                                  color: kTexto,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Porcentaje general
                      Text(
                        '${(porcentajeGeneral * 100).toInt()}%',
                        style: TextStyle(
                          color: porcentajeGeneral > 0.70
                              ? kRojo
                              : kVerde,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  'Detalle semanal',
                  style: TextStyle(
                    color: kTexto,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Semana 1
                semanaButton(
                  semana: 'Semana 1',
                  cantidad: 'Q 90.00',
                  porcentaje: 0.82,
                  gastos: 'Q 410.00 gastados',
                ),

                const SizedBox(height: 14),

                // Semana 2
                semanaButton(
                  semana: 'Semana 2',
                  cantidad: 'Q 500.00',
                  porcentaje: 0.00,
                  gastos: 'Sin gastos registrados',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget semanaButton({
  required String semana,
  required String cantidad,
  required double porcentaje,
  required String gastos,
}) {
  // Si se utiliza más del 70%, se muestra rojo.
  // Si está en 70% o menos, se muestra verde.
  final Color colorPorcentaje =
      porcentaje > 0.70 ? kRojo : kVerde;

  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(18),
        backgroundColor: kSuperficie,
        foregroundColor: kTexto,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            color: kBorde,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: kVerdeOscuro,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: kVerde,
                      size: 19,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    semana,
                    style: const TextStyle(
                      color: kTexto,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Cantidad restante
              Text(
                cantidad,
                style: TextStyle(
                  color: colorPorcentaje,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Barra de progreso
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: porcentaje,
              minHeight: 7,
              backgroundColor: kSuperficie2,
              valueColor: AlwaysStoppedAnimation<Color>(
                colorPorcentaje,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                gastos,
                style: const TextStyle(
                  color: kMuted,
                  fontSize: 12,
                ),
              ),
              Text(
                '${(porcentaje * 100).toInt()}% utilizado',
                style: TextStyle(
                  color: colorPorcentaje,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}