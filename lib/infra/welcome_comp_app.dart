import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/screens/layout_screen.dart'; 
import 'ui/theme/theme.dart';

class WelcomeCompApp extends StatelessWidget {
  const WelcomeCompApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(), 
      theme: buildTheme(),
    );
  }
}
