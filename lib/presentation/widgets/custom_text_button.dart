import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonName;
  final double? height;
  final double? width;

  const CustomTextButton({super.key, required this.onPressed, required this.buttonName, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final Size screenSize  = MediaQuery.of(context).size;

    return  SizedBox(
      width: width?? screenSize.width,
      height: height?? 67,
      child: TextButton(
          onPressed: onPressed,
          child: Text(buttonName,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1,
            color: Color(0xffFFF9FF),
          ),),
      ),
    );
  }
}
