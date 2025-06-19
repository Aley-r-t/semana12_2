import 'package:flutter/cupertino.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    _emailCtrl.addListener(_validate);
    _passCtrl.addListener(_validate);
  }

  void _validate() {
    final valid = _emailCtrl.text.isNotEmpty && _passCtrl.text.isNotEmpty;
    if (valid != _canSubmit) {
      setState(() => _canSubmit = valid);
    }
  }

  void _submit() {
    // Aquí iría la lógica real de autenticación
    Navigator.pushReplacementNamed(context, '/menu');
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Iniciar Sesión'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo o ícono de la app
              Align(
                alignment: Alignment.center,
                child: Icon(
                  CupertinoIcons.lock_shield,
                  size: 80,
                  color: CupertinoColors.activeBlue,
                ),
              ),
              const SizedBox(height: 40),

              // Sección de formulario
              CupertinoFormSection.insetGrouped(
                header: const Text('Cuenta'),
                children: [
                  CupertinoTextFormFieldRow(
                    controller: _emailCtrl,
                    placeholder: 'correo@ejemplo.com',
                    keyboardType: TextInputType.emailAddress,
                    prefix: const Text('Email'),
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                  ),
                  CupertinoTextFormFieldRow(
                    controller: _passCtrl,
                    placeholder: '••••••••',
                    prefix: const Text('Contraseña'),
                    obscureText: true,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.password],
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Botón de entrar
              CupertinoButton.filled(
                onPressed: _canSubmit ? _submit : null,
                child: const Text('Entrar'),
              ),

              const SizedBox(height: 16),

              // Enlace de acción extra
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text('¿Olvidaste tu contraseña?'),
                onPressed: () {
                  // Aquí podrías navegar a otra ruta
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
