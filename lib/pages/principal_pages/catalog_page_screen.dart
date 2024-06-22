import 'package:flutter/material.dart';

class CatalogPageScreen extends StatelessWidget {
  const CatalogPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mundo Artesano"),
        actions: const [],
      ),
      body: const Center(
        child: Text("Catalogo"),
      ),
    );
  }
}
