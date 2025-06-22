import 'package:e_commerece/core/utils/app_assets.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/features/ui/pages/home_screen/cubit/home_screen_state.dart';
import 'package:e_commerece/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          // appBar: _buildAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: AppColors.primaryColor),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    currentIndex: viewModel.selectedIndex,
                    onTap: viewModel.bottomNavOnTap,
                    iconSize: 24.sp,
                    items: [
                      _bottomNavBarItemBuilder(
                          isSelcted: viewModel.selectedIndex == 0,
                          selectedIcon: AppAssets.selectedHomeIcon,
                          unSelectedIcon: AppAssets.unSelectedHomeIcon),
                      _bottomNavBarItemBuilder(
                          isSelcted: viewModel.selectedIndex == 1,
                          selectedIcon: AppAssets.selectedCategoryIcon,
                          unSelectedIcon: AppAssets.unSelectedCategoryIcon),
                      _bottomNavBarItemBuilder(
                          isSelcted: viewModel.selectedIndex == 2,
                          selectedIcon: AppAssets.selectedFavouriteIcon,
                          unSelectedIcon: AppAssets.unSelectedFavouriteIcon),
                      _bottomNavBarItemBuilder(
                          isSelcted: viewModel.selectedIndex == 3,
                          selectedIcon: AppAssets.selectedAccountIcon,
                          unSelectedIcon: AppAssets.unSelectedAccountIcon),
                    ])),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelcted,
      required String selectedIcon,
      required String unSelectedIcon}) {
    return BottomNavigationBarItem(
        icon: CircleAvatar(
          foregroundColor:
              isSelcted ? AppColors.primaryColor : AppColors.whiteColor,
          backgroundColor:
              isSelcted ? AppColors.whiteColor : AppColors.transparentColor,
          radius: 25.r,
          child: Image.asset(isSelcted ? selectedIcon : unSelectedIcon),
        ),
        label: " ");
  }
}
