import 'package:flutter/cupertino.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String route;

  const CustomListTile({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
