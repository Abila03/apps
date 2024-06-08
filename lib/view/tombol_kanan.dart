import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback onTap;

  const ProfileMenuItem({super.key, required this.title, this.titleColor = Colors.black, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}