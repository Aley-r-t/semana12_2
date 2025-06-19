import 'package:flutter/cupertino.dart';
import '../views/login/login_view.dart';
import '../views/menu/menu_view.dart';
import '../views/faq/faq_view.dart';
import '../views/calculator/calculator_view.dart';
import '../views/form/form_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginView(),
  '/menu': (context) => const MenuView(),
  '/faq': (context) => const FaqView(),
  '/calculator': (context) => const CalculatorView(),
  '/form': (context) => const FormView(),
};
