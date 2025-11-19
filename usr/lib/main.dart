import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const HeatStrokeApp());
}

class HeatStrokeApp extends StatelessWidget {
  const HeatStrokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prevención Golpes de Calor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFFFF3E0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFFBF360C)),
          headlineMedium: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD84315)),
          bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF4E342E)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF6D4C41)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/logo.svg', height: 40),
            const SizedBox(width: 10),
            const Text(
              'Guía Contra el Calor',
              style: TextStyle(
                  color: Color(0xFFBF360C), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeroSection(),
            const InfoSection(
              title: '¿Qué es un Golpe de Calor?',
              content:
                  'Es el trastorno más grave causado por el calor. Ocurre cuando el cuerpo no puede controlar su propia temperatura, la cual aumenta rápidamente y puede alcanzar los 41°C en pocos minutos. Es una emergencia médica que requiere tratamiento inmediato.',
              icon: Icons.wb_sunny,
            ),
            const InfoSection(
              title: 'Síntomas Principales',
              content:
                  '• Piel roja, caliente y seca (sin sudor)\n• Pulso rápido y fuerte\n• Dolor de cabeza palpitante\n• Mareos o vértigo\n• Náuseas o vómitos\n• Confusión o pérdida del conocimiento',
              icon: Icons.warning,
            ),
            const PreventionSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: const Color(0xFFFFE0B2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mantente Seguro Bajo el Sol',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Nuestra app te ayuda a prevenir, reconocer y actuar ante un golpe de calor. Tu bienestar es nuestra prioridad.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4511E),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Descargar la App (Próximamente)'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: SvgPicture.asset(
              'assets/images/hero_image.svg',
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const InfoSection(
      {super.key,
      required this.title,
      required this.content,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 50, color: Theme.of(context).primaryColor),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 15),
                Text(content, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PreventionSection extends StatelessWidget {
  const PreventionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      color: const Color(0xFFFFCC80),
      child: Column(
        children: [
          Text('¿Cómo Prevenirlo?',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 30),
          const Wrap(
            spacing: 40,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              PreventionTip(
                  icon: Icons.local_drink,
                  text: 'Bebe abundantes líquidos'),
              PreventionTip(
                  icon: Icons.beach_access,
                  text: 'Busca lugares frescos y a la sombra'),
              PreventionTip(
                  icon: Icons.watch_later,
                  text: 'Evita el ejercicio en horas de más calor'),
              PreventionTip(
                  icon: Icons.restaurant,
                  text: 'Come alimentos ligeros y frescos'),
              PreventionTip(
                  icon: Icons.wc, text: 'Usa ropa ligera y de colores claros'),
            ],
          )
        ],
      ),
    );
  }
}

class PreventionTip extends StatelessWidget {
  final IconData icon;
  final String text;

  const PreventionTip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        children: [
          Icon(icon, size: 50, color: const Color(0xFFBF360C)),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFF4E342E),
      child: const Text(
        '© 2024 App Prevención Golpes de Calor. Todos los derechos reservados.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
