import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/pages/details_page.dart';
import 'package:trips/pages/home_page.dart';
import 'package:trips/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(builder: ((context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadedState) {
          return const HomePage();
        }
        if (state is DetailState) {
          return DetailsPage();
        } if (state is LoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        } else {
          return Container();
        }
      })),
    );
  }
}
