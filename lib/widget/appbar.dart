import 'package:flutter/material.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWithBack({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }
}