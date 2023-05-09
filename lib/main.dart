import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muscle_up/constants/routes.dart';
import 'package:muscle_up/firebase_options.dart';
import 'package:muscle_up/pages/calendar/calendar.dart';
import 'package:muscle_up/pages/homePage/home.dart';
import 'package:muscle_up/pages/loginPage/login.dart';
import 'package:muscle_up/pages/registrationPage/registration.dart';
import 'package:muscle_up/pages/workoutsPage/workouts.dart';
import 'package:muscle_up/widgets/bottom_navigation.dart';
import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    // signOut();
  }

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
      },
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? homeRoute : loginRoute,
    );
  }
}
