import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/misc/dimensions.dart';
import 'package:trips/pages/widgets/app_large_text.dart';
import 'package:trips/pages/widgets/app_text.dart';

import '../cubit/app_cubit_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, states) {
          if (states is LoadedState) {
            var info = states.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: Dimensions.iconSize30,
                        color: Colors.black,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.width20),
                        height: Dimensions.height45,
                        width: Dimensions.height45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: const AppLargeText(text: "Discover"),
                ),
                 SizedBox(
                  height: Dimensions.height3,
                ),
                Container(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                      controller: _tabcontroller,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircularTabIndicator(
                          color: AppColors.mainColor, radius: Dimensions.radius4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        )
                      ]),
                )),
                Container(
                  padding: EdgeInsets.only(left: Dimensions.radius20),
                  height: Dimensions.height300,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabcontroller, children: [
                    ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context)
                                  .detailstate(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: Dimensions.width15, top: Dimensions.height10),
                              width: Dimensions.width200,
                              height: Dimensions.height150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 116, 111, 111),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              info[index].img),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        }),
                    const Text("there"),
                    const Text("bye")
                  ]),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore",
                        size: Dimensions.height20,
                      ),
                      AppText(
                        text: "see all",
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height3+2,
                ),
                Container(
                  height: Dimensions.height100,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(right: Dimensions.width45-5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(right: 50),
                                  height: Dimensions.height30*2,
                                  width: Dimensions.width30*2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("img/" +
                                              images.keys.elementAt(index)),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Container(
                                  child: AppText(
                                    text: images.values.elementAt(index),
                                    color: AppColors.textColor2,
                                  ),
                                )
                              ]));
                    },
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircularTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircularTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CircularPainter(color: color, radius: radius);
  }
}

class CircularPainter extends BoxPainter {
  final Color color;
  double radius;
  CircularPainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    Offset _circularOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset, radius, _paint);
  }
}
