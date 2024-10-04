import 'package:clean_onbording/core/constants/assets_constant.dart';
import 'package:clean_onbording/features/home/home_screen.dart';
import 'package:clean_onbording/features/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus(context);
  }

  _checkOnboardingStatus(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isShowOnboarding = sp.getBool('isShowOnboarding') ?? false;

    await Future.delayed(const Duration(seconds: 3)); 

    if (isShowOnboarding) { 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 53, 95),
      body: Center(
        child: Image.asset(SPLASH_LOGO),
      ),
    );
  }
}
