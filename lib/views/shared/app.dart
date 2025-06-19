import 'package:flutter/cupertino.dart';
import '../../routes/app_routes.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter iOS App',
      theme: cupertinoTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
