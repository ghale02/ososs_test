import 'package:flutter/material.dart';
import 'package:ososs_test/ui/utils/app_themes.dart';
import 'package:ososs_test/utils/app_routes.dart';

void main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generate,
      theme: AppThemes.lightTheme(),
    );
  }
}
