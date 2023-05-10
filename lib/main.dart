import 'package:flutter/material.dart';
import 'package:muscle_up/constants/routes.dart';
import 'package:muscle_up/pages/calendar/calendar.dart';
import 'package:muscle_up/pages/loginPage/login.dart';
import 'package:muscle_up/pages/registrationPage/registration.dart';
import 'package:muscle_up/pages/verify_email/verify_email_view.dart';
import 'package:muscle_up/pages/workoutsPage/workouts.dart';
import 'package:muscle_up/services/auth/auth_service.dart';
import 'package:muscle_up/widgets/bottom_navigation.dart';
import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase().initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muscle Up',
      theme: ThemeData(appBarTheme: AppBarTheme(color: kBottomSelectedColor)),
      debugShowCheckedModeBanner: false,
      routes: {
        loginRoute: (context) => LoginView(),
        homeRoute: (context) => BottomNav(),
        registerRoute: (context) => RegistrationView(),
        workoutsRoute: (context) => WorkoutsPage(),
        calendarRoute: (context) => CalendarPage(),
        verifyEmailRoute: (context) => VerifyEmailView(),
      },
      initialRoute:
          AuthService.firebase().currentUser != null ? homeRoute : loginRoute,
    );
  }
}
