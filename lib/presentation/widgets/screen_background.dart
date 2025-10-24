import 'package:flutter/material.dart';

import '../../core/constants/assets_images_path.dart';
class ScreenBackground extends StatelessWidget {
  final Widget child;

  const ScreenBackground({
    super.key, required this.child,

  });



  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return SafeArea(child: Stack(
      children: [

        //--------------------- top background image --------
        Positioned(
          top: 0,
          child: Image.asset(AssetsImagesPath.topRectangle,
            height: screenHeight * .20,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),

        //--------------------- bottom background image --------
        Positioned(
          bottom: 0,
          child: Image.asset(AssetsImagesPath.bottomRectangle,
            height: screenHeight * .20,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: child,
        )


      ],
    ));
  }
}