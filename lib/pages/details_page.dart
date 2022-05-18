import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/misc/dimensions.dart';
import 'package:trips/pages/widgets/app_button.dart';
import 'package:trips/pages/widgets/app_large_text.dart';
import 'package:trips/pages/widgets/app_text.dart';
import 'package:trips/pages/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final int _checkedStars = 4;
  int _selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height300+50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/mountain.jpeg"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: Dimensions.height100/2,
              left: Dimensions.width10,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubit>(context).goback();
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height300-40,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20, right: Dimensions.width20),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height100*5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$320",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        AppText(
                          text: "USA California",
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < _checkedStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),
                        SizedBox(
                          width: Dimensions.width10/2,
                        ),
                        const AppText(text: "(4.0)")
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: Dimensions.height20,
                    ),
                    SizedBox(
                      height: Dimensions.height10/2,
                    ),
                    const AppText(text: "number of People in your group"),
                    SizedBox(
                      height: Dimensions.height10/2,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            child: AppButton(
                              color: _selectedindex == index
                                  ? Colors.white
                                  : Colors.black,
                              size: Dimensions.height10*5,
                              backgroundColor: _selectedindex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: _selectedindex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: Dimensions.height20,
                    ),
                    SizedBox(
                      height: Dimensions.height10/2,
                    ),
                    AppText(
                      text:
                          "Yosemite National Park is Located in central sierra nevada in the us state of California, it is located near thewild protected alps",
                      color: AppColors.mainTextColor,
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              children: [
                AppButton(
                    color: AppColors.textColor1,
                    size: Dimensions.height100/2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border),
                SizedBox(
                  width: Dimensions.width20
                ),
                ResponsiveButton(
                  isResponsive: true,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
