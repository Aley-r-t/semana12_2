import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultado = '';
  String _operacion = '+';

  void _calcular() {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _resultado = '⚠️ Ingresa números válidos';
      });
      return;
    }

    double resultado = 0;

    switch (_operacion) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '×':
        resultado = num1 * num2;
        break;
      case '÷':
        if (num2 == 0) {
          _resultado = '🚫 División por cero';
          setState(() {});
          return;
        }
        resultado = num1 / num2;
        break;
    }

    setState(() {
      _resultado = 'Resultado: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text('Calculadora')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CupertinoTextField(
                controller: _num1Controller,
                placeholder: 'Número 1',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
              ),
              const SizedBox(height: 12),
              CupertinoTextField(
                controller: _num2Controller,
                placeholder: 'Número 2',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
              ),
              const SizedBox(height: 12),
              CupertinoSegmentedControl<String>(
                children: const {
                  '+': Text('+'),
                  '-': Text('-'),
                  '×': Text('×'),
                  '÷': Text('÷'),
                },
                groupValue: _operacion,
                onValueChanged: (value) {
                  setState(() {
                    _operacion = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: _calcular,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              Text(
                _resultado,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
