import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/addproperty/addproperty.dart';
import 'package:gam3a/cubit/states.dart';

import '../favourites/favourites_Screen.dart';
import '../home/home.dart';
import '../profile/profile_screen.dart';

class RealEstateCubit extends Cubit<RealEstateStates>
{
  RealEstateCubit() : super(RealEstateInitialState());

  static RealEstateCubit get(context) => BlocProvider.of(context);
  int currentIndex =0;
  List<Widget>bottomScreens=[
    Home(),
    FavouritesScreen(),
    AddProperty(),
    ProfileScreen(),
  ];
  void ChangeBottom(int index){
    currentIndex=index;
    emit(RealEstateChangeBottomNavState());
  }
}