// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/misc/dimensions.dart';
import 'package:trips/pages/widgets/app_large_text.dart';
import 'package:trips/pages/widgets/app_text.dart';
import 'package:trips/pages/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin:
                  EdgeInsets.only(top: Dimensions.height100, left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(text: "Mountains"),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Container(
                          width: Dimensions.width200,
                          child: AppText(
                            text:
                                "Mountains gives you an Incredible sense of freedom and endurance test",
                            size: Dimensions.height10+4,
                            color: AppColors.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context).getState();
                          },
                          child: Container(
                            width: Dimensions.width200,
                            child: Row(
                              children: [ResponsiveButton(
                                width: Dimensions.width100+20,
                              )],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexSlider) {
                        return Container(
                          width: Dimensions.width10-2,
                          height: index == indexSlider ? Dimensions.height20 : Dimensions.height10-2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius4*2),
                              color: index == indexSlider
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.2)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
