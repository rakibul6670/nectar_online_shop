import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/assets_images_path.dart';
import 'package:nectar_online_shop/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      //-------------- after 3 second got to onboarding screen -----------
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
        (predicate) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize  = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      //================== body ====================================
      body: SafeArea(
        child: Center(
          child: Image.asset(AssetsImagesPath.splashLogo,
              height: 78,
            width: screenSize.width * .70,
          ),
        ),
      ),
    );
  }
}
