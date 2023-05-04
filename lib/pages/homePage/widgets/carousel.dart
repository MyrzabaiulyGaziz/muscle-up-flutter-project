import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  final String name;
  final String imageURL;

  const Carousel({required this.name, required this.imageURL});

  @override
  List<Object> get props => [name, imageURL];

  static List<Carousel> carousel = [
    Carousel(
        name: 'Deadlift',
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXDkThIy4oVo55s-nv_f1cqaHLUAMZMXGdtg&usqp=CAU'),
    Carousel(
        name: 'Squats',
        imageURL:
            'https://static.strengthlevel.com/images/illustrations/squat-1000x1000.jpg'),
    Carousel(
        name: 'Pull-ups',
        imageURL:
            'https://static.strengthlevel.com/images/illustrations/pull-ups-1000x1000.jpg'),
  ];
}
