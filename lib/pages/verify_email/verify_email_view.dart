import 'package:flutter/material.dart';
import 'package:muscle_up/constants/routes.dart';
import 'package:muscle_up/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
          'We\'ve sent you an email verification. Please open it to verify yoir account.'),
      const Text(
          'If you haven\'t received a verification email yet, press the button below'),
      TextButton(
        onPressed: () async {
          AuthService.firebase().sendEmailVerification();
        },
        child: const Text('Send email verification'),
      ),
      TextButton(
          onPressed: () async {
            await AuthService.firebase().logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
          },
          child: const Text(
            'Restart',
          )),
    ]);
  }
}
