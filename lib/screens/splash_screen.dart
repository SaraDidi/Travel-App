import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_routes.dart';
import 'package:travel_app/utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 5 seconds and navigate to the Home Screen
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        AppRoutes.routePushReplacement(context, AppRoutes.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0172B2), // Hex color #0172B2
              Color(0xFF001645), // Hex color #001645
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Travel",
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: fullWidth(context) * 0.02),
                Image.asset("assets/icons/world.png"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Find Your Dream\nDestination With Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
