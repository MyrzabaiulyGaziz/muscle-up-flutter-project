import 'package:flutter/material.dart';
import 'package:muscle_up/pages/calendar/calendar.dart';
import 'package:muscle_up/pages/homePage/home.dart';
import 'package:muscle_up/pages/workoutsPage/workouts.dart';

import '../constants/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottonBarWidthContainer = 5;

  List<Widget> pages = [
    const HomePage(),
    const WorkoutsPage(),
    const CalendarPage()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: updatePage,
          selectedItemColor: kBottomSelectedColor,
          unselectedItemColor: kBottomUnselectedColor,
          backgroundColor: kBottomBackgroundColor,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 0
                                  ? kBottomSelectedColor
                                  : kBottomBackgroundColor,
                              width: bottonBarWidthContainer))),
                  child: const Icon(Icons.home),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 1
                                  ? kBottomSelectedColor
                                  : kBottomBackgroundColor,
                              width: bottonBarWidthContainer))),
                  child: const Icon(Icons.list),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 2
                                  ? kBottomSelectedColor
                                  : kBottomBackgroundColor,
                              width: bottonBarWidthContainer))),
                  child: const Icon(Icons.calendar_today_rounded),
                )),
          ]),
    );
  }
}
