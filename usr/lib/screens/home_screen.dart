import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Emergencia'),
          content: const Text(
              '¿Estás seguro de que deseas enviar una alerta a tus contactos de emergencia?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('ENVIAR ALERTA'),
              onPressed: () {
                // Aquí iría la lógica para enviar la alerta
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Alerta de emergencia enviada.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.contacts),
            onPressed: () {
              Navigator.pushNamed(context, '/contacts');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Sección de Temperatura
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.orange.shade100,
            child: Column(
              children: [
                Text(
                  'Temperatura Actual',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                const Text(
                  '38°C', // Dato simulado
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBF360C),
                  ),
                ),
                const Text(
                  '¡Peligro! Busca un lugar fresco.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFD84315),
                  ),
                ),
              ],
            ),
          ),

          // Botón de Emergencia
          Expanded(
            child: GestureDetector(
              onTap: () => _showEmergencyDialog(context),
              child: Container(
                color: Colors.red.shade400,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning_amber_rounded,
                          size: 80, color: Colors.white),
                      SizedBox(height: 20),
                      Text(
                        'TOCAR EN CASO DE EMERGENCIA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Sección de Consejos
          Container(
            height: 150,
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PreventionTipCard(
                    icon: Icons.local_drink, text: 'Bebe muchos líquidos'),
                SizedBox(width: 10),
                PreventionTipCard(
                    icon: Icons.wb_sunny, text: 'Evita el sol directo'),
                SizedBox(width: 10),
                PreventionTipCard(
                    icon: Icons.restaurant, text: 'Come ligero'),
                SizedBox(width: 10),
                PreventionTipCard(
                    icon: Icons.watch_later, text: 'Pausa tus actividades'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PreventionTipCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const PreventionTipCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
