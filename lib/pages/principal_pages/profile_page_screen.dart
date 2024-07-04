import 'package:flutter/material.dart';
import 'package:mundo_artesano/widget/craft/craft_view_card.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mundo Artesano',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.bold, // Texto blanco
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart_page');
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined)),
          IconButton(
              onPressed: () {
                Navigator.restorablePushNamedAndRemoveUntil(
                    context, '/log_in', (route) => false);
              },
              icon: const Icon(Icons.logout))
        ], // Fondo del menú
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://res.cloudinary.com/dcud5isuy/image/upload/v1713243400/user_icon_igzlwj.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ana Rodriguez',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'anaR23@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Artesano',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Acción para agregar artesanía
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Agregar artesanía'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Acción para editar perfil
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(child: CraftViewCard())
          ],
        ),
      ),
    );
  }
}
