import 'package:e_commerece/features/ui/pages/home_screen/cubit/home_screen_state.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/product_tab.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeInitialState());
  //todo : hold data handle logic
  int selectedIndex = 0;

  List<Widget> bodyList = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(HomeInitialState());
  }
}
