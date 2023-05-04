import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:muscle_up/pages/homePage/widgets/carousel.dart';

class PopularPrograms extends StatelessWidget {
  const PopularPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: double.infinity,
      height: 100,
      child: Column(children: [
        Text(
          'Popular programs',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: true,
          ),
          items: Carousel.carousel
              .map((carousel) => CarouselCart(carousel: carousel))
              .toList(),
        ),
      ]),
    );
  }
}

class CarouselCart extends StatelessWidget {
  const CarouselCart({super.key, required this.carousel});
  final Carousel carousel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(carousel.imageURL,
                  fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    carousel.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
