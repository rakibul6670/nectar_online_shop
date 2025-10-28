import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/app_colors.dart';
import 'package:nectar_online_shop/core/constants/assets_icons_path.dart';
import 'package:nectar_online_shop/core/constants/assets_images_path.dart';
import 'package:nectar_online_shop/presentation/screens/login_screen.dart';
import 'package:nectar_online_shop/presentation/widgets/custom_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    // final screenWidth = screenSize.width;

    return Scaffold(
      //======================== Body ====================
      body: SafeArea(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsImagesPath.onboardingBg,
              ),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * .50),
              //=================== Carrot Image =======================
              Image.asset(AssetsIconsPath.whiteCarrot),

              //=========================== Welcome Message =================
              Text(
                "Welcome \n to our store",
                textAlign: TextAlign.center,
                style: TextStyle(
                  //height: 48 / 28,
                  fontSize: 48,

                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              //=========================== Welcome Subtitle Message =================
              Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(
                  height: 16 / 15,
                  fontSize: 15,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),

              //======================== Get Started Button ============================
              SizedBox(height: 30,),

              CustomTextButton(
                width: screenSize.width * .8,
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(),),(predicate)=> false,
                ),
                buttonName: "Get Started",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
