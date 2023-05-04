import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Color(0xfff8f8f8),
      child: IconTheme(
        data: IconThemeData(color: Color(0xffabadb4), size: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              color: Color(0xffA17258),
            ),
            Icon(Icons.list),
            Icon(Icons.calendar_today_rounded),
          ],
        ),
      ),
    );
  }
}
