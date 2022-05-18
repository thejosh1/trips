import 'package:flutter/material.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/misc/dimensions.dart';
import 'package:trips/pages/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: Dimensions.height30*2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15-5),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: EdgeInsets.only(left: Dimensions.radius20),
              child: AppText(text: "Book Trip now", color: Colors.white)):Container(),
            Image.asset("img/button-one.png")
          ],
        ),
      ),
    );
  }
}
