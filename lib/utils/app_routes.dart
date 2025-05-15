import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/all_places_screen.dart';
import 'package:flutter_portfolio/screens/details_screen.dart';
import 'package:flutter_portfolio/screens/main_screen.dart';
import 'package:flutter_portfolio/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String main = "/main";
  static const String details = "/details";
  static const String allPlaces = "/allPlaces";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case allPlaces:
        return MaterialPageRoute(builder: (_) => const AllPlacesScreen());

      case details:
      final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>  DetailsScreen(
            imagePath: args['imagePath'] ?? '', 
            name: args['name']?? '',  
            address: args['address']?? ''),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }

  // Helper method: Push replacement and clear all previous routes
  static void routePushReplacementUntil(
    BuildContext context,
    String routeName,
  ) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  // Helper method: Push replacement
  static void routePushReplacement(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  // Helper method: Push
  static Future<void> routePush(BuildContext context, String routeName, { Map<String, dynamic> args = const {} }) async {
    await Navigator.of(context).pushNamed(routeName, arguments: args);
  }

  // Helper method: Pop
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
