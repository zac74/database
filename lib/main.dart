import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/addproperty/addproperty.dart';
import 'package:gam3a/cubit/cubit.dart';
import 'package:gam3a/home/home.dart';
import 'package:gam3a/homescreen.dart';
import 'package:gam3a/testing.dart';

import 'Database/database_testing.dart';

void main() async{
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=>RealEstateCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Data(),
      ),
    );
  }
}

