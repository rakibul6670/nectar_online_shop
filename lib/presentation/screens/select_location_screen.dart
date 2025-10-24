import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/assets_images_path.dart';
import 'package:nectar_online_shop/presentation/widgets/custom_text_button.dart';
import 'package:nectar_online_shop/presentation/widgets/screen_background.dart';
import 'dashboard_screen.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Size screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      //======================= Body Section ===================
      body: ScreenBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //------------------------- back button -------------
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, size: 25),
                ),
              ),

              //------------------- Map Image ----------------------
              Image.asset(AssetsImagesPath.map,
                width: screenWidth * .6,
                height: screenHeight * .30,
                // fit: BoxFit.cover,
              ),

              SizedBox(height: 40,),
              //----------------- title ------------
              Text("Select Your Location", style: textTheme.headlineMedium),

              //---------------- sub title ----------
              SizedBox(height: 15,),
              Text(
                "Swithch on your location to stay in tune with \n what’s happening in your area",
                textAlign: TextAlign.center,
                style: textTheme.titleSmall!.copyWith(
                  color: Color(0xff7C7C7C),
                ),
              ),

              //-----------------------Submit  Button --------
              SizedBox(height: screenHeight * .25,),
              Center(
                child: CustomTextButton(

                    onPressed: ()=> Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    ),
                    buttonName: "Submit"
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
