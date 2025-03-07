import 'package:flutter/material.dart';
import 'package:game_code/infra/ui/screens/home_screen.dart';
import 'package:game_code/infra/ui/theme/theme.dart';

class GameCodeApp extends StatelessWidget {
  const GameCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: buildTheme(Brightness.light),
    );
  }
}
