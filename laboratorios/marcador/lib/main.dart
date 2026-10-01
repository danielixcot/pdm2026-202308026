import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  static const String nombreEquipoA = 'Chatio';
  static const String nombreEquipoB = 'Claudiño';

  int _puntosA = 0;
  int _puntosB = 0;

  void _sumarA() {
    setState(() {
      _puntosA++;
    });
  }

  void _restarA() {
    setState(() {
      if (_puntosA > 0) _puntosA--;
    });
  }

  void _sumarB() {
    setState(() {
      _puntosB++;
    });
  }

  void _restarB() {
    setState(() {
      if (_puntosB > 0) _puntosB--;
    });
  }

  void _reiniciar() {
    setState(() {
      _puntosA = 0;
      _puntosB = 0;
    });
  }

  String get _mensaje {
    if (_puntosA == _puntosB) return 'Empate';
    if (_puntosA > _puntosB) return 'Va ganando $nombreEquipoA';
    return 'Va ganando $nombreEquipoB';
  }

  Color get _colorA {
    if (_puntosA > _puntosB) return const Color.fromARGB(255, 50, 121, 52);
    return Colors.grey.shade300;
  }

  Color get _colorB {
    if (_puntosB > _puntosA) return  const Color.fromARGB(255, 50, 121, 52);;
    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Liga de Agentes',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _EquipoCard(
                    nombre: nombreEquipoA,
                    puntos: _puntosA,
                    color: _colorA,
                    onSumar: _sumarA,
                    onRestar: _restarA,
                  ),
                  _EquipoCard(
                    nombre: nombreEquipoB,
                    puntos: _puntosB,
                    color: _colorB,
                    onSumar: _sumarB,
                    onRestar: _restarB,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                _mensaje,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _reiniciar,
                child: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EquipoCard extends StatelessWidget {
  const _EquipoCard({
    required this.nombre,
    required this.puntos,
    required this.color,
    required this.onSumar,
    required this.onRestar,
  });

  final String nombre;
  final int puntos;
  final Color color;
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$puntos',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: onRestar,
                  child: const Text('-1'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onSumar,
                  child: const Text('+1'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
