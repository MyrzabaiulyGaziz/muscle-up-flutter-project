import 'package:flutter/material.dart';
import 'package:muscle_up/pages/homePage/home.dart';
import 'package:muscle_up/pages/loginPage/login.dart';
import 'package:muscle_up/pages/registrationPage/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Muscle Up',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => HomePage(),
        '/registration': (context) => RegistrationView(),
      },
      initialRoute: '/registration',
    ),
  );
}
