import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mundo Artesano"),
        actions: const [],
      ),
      body: const Center(
        child: Text("Hola Mundo"),
      ),
    );
  }
}
