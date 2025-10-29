import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final Color? iconColor;
  final IconData icons;
  final VoidCallback onTap;

  const CustomIconButton({
    super.key,
    this.color,
    this.height,
    this.width,
    required this.icons,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 45,
        width: width ?? 45,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,   //Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(0xffE2E2E2)),
        ),
        child: Icon(icons, color: iconColor ?? Color(0xff53B175)),
      ),
    );
  }
}
