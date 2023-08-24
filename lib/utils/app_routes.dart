import 'package:flutter/material.dart';
import 'package:ososs_test/ui/screens/animations.dart';
import 'package:ososs_test/ui/screens/home.dart';
import 'package:ososs_test/ui/screens/pokemons.dart';
import 'package:ososs_test/ui/screens/splash.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const pokemons = '/pokemons';
  static const animations = '/animations';
  static Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case pokemons:
        return MaterialPageRoute(builder: (_) => const PokemonsPage());
      case animations:
        var args = settings.arguments as AnimationsArgs;
        return MaterialPageRoute(
            builder: (_) => AnimationsPage(
                  args: args,
                ));
    }
    return null;
  }
}
