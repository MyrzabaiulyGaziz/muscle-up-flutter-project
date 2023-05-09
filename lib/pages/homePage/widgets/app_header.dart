import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

enum MenuAction { logout }

class AppHeader extends StatelessWidget {
  final String text;
  const AppHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: Column(
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
              text,
              style: TextStyle(
                color: Color(0xff251B15),
                fontSize: 20,
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldSignOut = await showSignOutDialog(context);
                  if (shouldSignOut) {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login',
                      (_) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                    value: MenuAction.logout, child: Text('Sign out'))
              ];
            },
          )
        ]);
  }
}

Future<bool> showSignOutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sign out')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
