import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muscle_up/firebase_options.dart';
import 'package:muscle_up/pages/homePage/widgets/app_header.dart';
import 'package:muscle_up/pages/homePage/widgets/last_action.dart';
import 'package:muscle_up/pages/homePage/widgets/popular_programs.dart';
import 'package:muscle_up/widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                print('You are a verified user');
              } else {
                print('You need to verify your email first');
              }
              return Material(
                child: Column(
                  children: [
                    AppHeader(),
                    LastAction(),
                    PopularPrograms(),
                    BottomNav(),
                  ],
                ),
              );
              ;
            default:
              return Text('Loading...');
          }
        },
      ),
    );
  }
}
