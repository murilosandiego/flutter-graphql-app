import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/main/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuConta Marketplace',
      theme: ThemeData(
        primaryColor: const Color(0xFF820BD1),
        accentColor: const Color(0xFF820BD1),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF820BD1),
          secondary: Color(0xFF820BD1),
        ),
      ),
      initialRoute: Routes.home,
      routes: Routes.getRoutes(context),
    );
  }
}
