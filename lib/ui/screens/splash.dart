import 'package:flutter/material.dart';
import 'package:ososs_test/utils/app_routes.dart';

///we use [StatefulWidget] in order to access the [BuildContext]
/// in [initState] for navigation
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //start 3 second timer and the navigate to home screen
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushReplacementNamed(AppRoutes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}
