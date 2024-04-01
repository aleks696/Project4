import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ListTileWidget({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      tileColor: color,
      onTap: onTap,
    );
  }
}
