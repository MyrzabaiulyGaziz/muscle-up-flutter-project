import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muscle_up/firebase_options.dart';
import 'package:muscle_up/pages/homePage/widgets/app_header.dart';
import 'package:muscle_up/pages/homePage/widgets/last_action.dart';
import 'package:muscle_up/pages/loginPage/login.dart';
import 'package:muscle_up/pages/verify_email/verify_email_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppHeader(text: 'Let\'s get in shape')),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  if (user.emailVerified) {
                    return Column(
                      children: [
                        LastAction(),
                      ],
                    );
                  } else {
                    return const VerifyEmailView();
                  }
                } else {
                  return const LoginView();
                }
              default:
                return CircularProgressIndicator();
            }
          },
        ));
  }
}
