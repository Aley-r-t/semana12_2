import 'package:flutter/cupertino.dart';
import '../shared/custom_list_tile.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Menú')),
      child: ListView(
        children: [
          CustomListTile(title: 'Preguntas Frecuentes', route: '/faq'),
          CustomListTile(title: 'Calculadora', route: '/calculator'),
          CustomListTile(title: 'Formulario', route: '/form'),
          CustomListTile(title: 'Cerrar Sesión', route: '/'),
        ],
      ),
    );
  }
}
