import 'package:flutter/material.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mundo Artesano"),
        actions: const [],
      ),
      body: const Center(
        child: Text("Perfil de Usuario"),
      ),
    );
  }
}
