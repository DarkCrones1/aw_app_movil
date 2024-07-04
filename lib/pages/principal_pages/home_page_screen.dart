import 'package:flutter/material.dart';
import 'package:mundo_artesano/widget/craft/craft_view_card.dart';
import 'package:mundo_artesano/widget/swiper/craft_slideshow.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

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
        actions: const [],
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
                CraftSlideShow(),
                Text("Lo más vendido"),
                Expanded(child: CraftViewCard())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
