import 'package:flutter/material.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({
    super.key,
    required this.menu,
    required this.content,
  });

  final Widget menu;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        children: [menu, Expanded(child: content)],
      ),
    );
  }
}
