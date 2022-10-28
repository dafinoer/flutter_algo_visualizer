import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key, required this.menu, required this.content});

  final Widget menu;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: menu,
      body: content,
    );
  }
}
