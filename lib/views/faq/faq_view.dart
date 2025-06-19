import 'package:flutter/cupertino.dart';
import '../shared/app_card.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'pregunta': '¿Cómo ingreso mis datos?',
        'respuesta': 'Ve a la sección de formulario desde el menú.'
      },
      {
        'pregunta': '¿Qué hace la calculadora?',
        'respuesta': 'Realiza operaciones básicas en modo iOS estilizado.'
      },
      {
        'pregunta': '¿Puedo cerrar sesión?',
        'respuesta': 'Claro, está la opción en el menú principal.'
      },
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Preguntas Frecuentes'),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return AppCard(
              title: faq['pregunta']!,
              content: faq['respuesta']!,
            );
          },
        ),
      ),
    );
  }
}
