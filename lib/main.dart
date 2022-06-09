import 'package:flutter/material.dart';
import 'package:team_soccer_coach/di/di.dart';
import 'package:team_soccer_coach/screens/home/home_screen.dart';
import 'package:team_soccer_coach/screens/login/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:team_soccer_coach/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initializeDateFormatting('es');
  diInitializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Soccer - Coach',
      debugShowCheckedModeBanner: false,
      theme: ligthTheme,
      home: HomeScreen.init(),
    );
  }
}
