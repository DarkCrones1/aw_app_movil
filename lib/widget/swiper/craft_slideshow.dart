import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CraftSlideShow extends StatelessWidget {
  // final List<String> crafts;

  const CraftSlideShow({
    super.key,
    /*required this.crafts*/
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: colors.secondary
            )
          ),
          itemCount: images.length,
          itemBuilder: (context, index) => _Slide(image: images[index])),
    );
  }
}

final List<String> images = [
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
];

class _Slide extends StatelessWidget {
  final String image;

  const _Slide({required this.image});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              images.first,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadginProgress) {
                if (loadginProgress != null) {
                  return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12));
                }
                return FadeIn(child: child);
              },
            ),
          )),
    );
  }
}
