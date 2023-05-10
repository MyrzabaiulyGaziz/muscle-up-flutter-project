import 'package:flutter/material.dart';
import 'package:muscle_up/pages/homePage/widgets/app_header.dart';
import 'package:muscle_up/pages/homePage/widgets/last_action.dart';
import 'package:muscle_up/pages/loginPage/login.dart';
import 'package:muscle_up/pages/verify_email/verify_email_view.dart';
import 'package:muscle_up/services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppHeader(text: 'Let\'s get in shape')),
        body: FutureBuilder(
          future: AuthService.firebase().initialize(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = AuthService.firebase().currentUser;
                if (user != null) {
                  if (user.isEmailVerified) {
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
