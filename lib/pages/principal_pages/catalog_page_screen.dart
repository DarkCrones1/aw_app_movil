import 'package:flutter/material.dart';
import 'package:mundo_artesano/widget/craft/craft_view_card.dart';

class CatalogPageScreen extends StatelessWidget {
  const CatalogPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'ROBOTO',
                    fontSize: 30,
                  ),
                ),
                Expanded(child: CraftViewCard())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
