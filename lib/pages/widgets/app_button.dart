import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/pages/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  double size;
  final Color backgroundColor;
  final Color borderColor;
  bool? isIcon;
  AppButton({Key? key,
    required this.color,
    this.text= '0',
    this.icon,
    required this.size,
    required this.backgroundColor,
    required this.borderColor,
    this.isIcon=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon==false?Center(child: AppText(text: text!, color: Colors.white,)):Center(child: Icon(icon, color: AppColors.textColor2,)),
    );
  }
}
