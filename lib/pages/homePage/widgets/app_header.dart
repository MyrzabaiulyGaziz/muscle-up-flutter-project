import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Stack(children: [
        CustomPaint(
          painter: HeaderPainter(),
          size: Size(double.infinity, 80),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Color(0xff251B15),
            ),
          ),
        ),
        Positioned(
          left: 30,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Gaziz!',
                style: TextStyle(
                  color: Color(0xffB4B4B4),
                  fontSize: 15,
                ),
              ),
              Text(
                'Let\'s get in shape!',
                style: TextStyle(
                  color: Color(0xff251B15),
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint backColor = Paint()..color = Color(0xffA17258);
    Paint circles = Paint()..color = Colors.white.withAlpha(40);
    canvas.drawRect(
      Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
      backColor,
    );

    canvas.drawCircle(Offset(size.width * .65, 10), 20, circles);
    canvas.drawCircle(Offset(size.width * .20, 40), 5, circles);
    canvas.drawCircle(Offset(size.width - 10, size.height - 10), 15, circles);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
