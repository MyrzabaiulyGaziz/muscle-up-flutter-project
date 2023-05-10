import 'package:flutter/material.dart';
import 'package:muscle_up/pages/homePage/widgets/app_header.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppHeader(text: 'Let\'s get in shape')),
      body: Column(
        children: [],
      ),
    );
  }
}
