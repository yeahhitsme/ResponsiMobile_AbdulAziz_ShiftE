import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        brightness: Brightness.dark, // Mengatur tema ke gelap
        primaryColor: Colors.blueAccent, // Warna primer biru
        colorScheme: ColorScheme.dark(primary: Colors.blueAccent), // Warna aksen biru
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto'), // Mengatur font Roboto
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
