import 'package:flutter/material.dart';

class CraftViewCard extends StatelessWidget {
  const CraftViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 3),
            itemCount: 10, // Ajusta el número de elementos según sea necesario
            itemBuilder: (context, index) => createItemCard(context),
          ),
        )
      ],
    );
  }

  Widget createItemCard(BuildContext context) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'image/loading.gif',
              image: 'image/mundoartesano.png',
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descripción',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$50',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
