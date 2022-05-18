import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trips/cubit/app_cubit.dart';
import 'package:trips/cubit/app_cubit_logic.dart';
import 'package:trips/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (context) => AppCubit(
          data: Dataservices(),
        ),
        child: const AppCubitLogic(),
      ),
    );
  }
}

