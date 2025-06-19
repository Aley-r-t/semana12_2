// lib/views/form/form_view.dart

import 'package:flutter/cupertino.dart';
import '../../models/person.dart';

// --- Aquí definimos la extensión para formatear la fecha ---
extension FechaCorta on DateTime {
  String toShortDate() {
    final d = this;
    return '${d.day.toString().padLeft(2, '0')}/'
           '${d.month.toString().padLeft(2, '0')}/'
           '${d.year}';
  }
}

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();

  DateTime _fechaNacimiento = DateTime(2000, 1, 1);
  String _sexo = 'Masculino';

  String _mensaje = '';

  void _guardarFormulario() {
    final nombre = _nombreController.text.trim();
    final apellido = _apellidoController.text.trim();

    if (nombre.isEmpty || apellido.isEmpty) {
      setState(() {
        _mensaje = '⚠️ Por favor, completa todos los campos.';
      });
      return;
    }

    final persona = Person(
      nombre: nombre,
      apellido: apellido,
      fechaNacimiento: _fechaNacimiento,
      sexo: _sexo,
    );

    setState(() {
      _mensaje =
          '✅ Persona ingresada:\n'
          '${persona.nombre} ${persona.apellido}\n'
          '${persona.fechaNacimiento.toShortDate()}\n'
          '${persona.sexo}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text('Formulario Persona')),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CupertinoTextField(
              controller: _nombreController,
              placeholder: 'Nombre',
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _apellidoController,
              placeholder: 'Apellido',
            ),
            const SizedBox(height: 20),
            const Text('Fecha de Nacimiento', style: TextStyle(fontSize: 16)),
            CupertinoButton(
              child: Text(
                _fechaNacimiento.toShortDate(),
                style: const TextStyle(color: CupertinoColors.activeBlue),
              ),
              onPressed: () => _mostrarDatePicker(context),
            ),
            const SizedBox(height: 20),
            const Text('Sexo', style: TextStyle(fontSize: 16)),
            CupertinoSegmentedControl<String>(
              children: const {
                'Masculino': Text('Masculino'),
                'Femenino': Text('Femenino'),
                'Otro': Text('Otro'),
              },
              groupValue: _sexo,
              onValueChanged: (value) => setState(() => _sexo = value),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              child: const Text('Guardar'),
              onPressed: _guardarFormulario,
            ),
            const SizedBox(height: 20),
            Text(_mensaje, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _mostrarDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _fechaNacimiento,
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() => _fechaNacimiento = newDate);
          },
        ),
      ),
    );
  }
}
