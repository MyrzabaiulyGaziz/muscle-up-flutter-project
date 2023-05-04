import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muscle_up/firebase_options.dart';
import 'package:muscle_up/pages/homePage/widgets/app_header.dart';
import 'package:muscle_up/pages/homePage/widgets/last_action.dart';
import 'package:muscle_up/pages/homePage/widgets/popular_programs.dart';
import 'package:muscle_up/pages/verify_email/verify_email_view.dart';
import 'package:muscle_up/widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user?.emailVerified ?? false) {
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
            } else {
              return const VerifyEmailView();
            }
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
