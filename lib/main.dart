import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/pages/home/home_page.dart';
import 'package:my_flutter_app/ui/pages/login/login_page.dart';
import 'package:my_flutter_app/ui/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) =>  const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
