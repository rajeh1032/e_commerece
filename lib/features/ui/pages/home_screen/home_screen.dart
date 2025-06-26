import 'package:e_commerece/core/utils/app_assets.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/features/ui/pages/home_screen/cubit/home_screen_state.dart';
import 'package:e_commerece/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
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
          appBar: _buildAppBar(viewModel.selectedIndex, context),
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

  PreferredSizeWidget _buildAppBar(int index, BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          style: AppStyles.regular14Text,
                          cursorColor: AppColors.primaryColor,
                          onTap: () {
                            //todo: implement search logic
                          },
                          decoration: InputDecoration(
                              border: _buildCustomBorder(),
                              enabledBorder: _buildCustomBorder(),
                              focusedBorder: _buildCustomBorder(),
                              contentPadding: EdgeInsets.all(16.h),
                              hintStyle: AppStyles.light14SearchHint,
                              hintText: "what do you search for?",
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: AppColors.primaryColor.withOpacity(0.75),
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed(AppRoutes.cartRoute);
                      },
                      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
                        builder: (context, state) {
                          return Badge(
                            alignment: AlignmentDirectional.topStart,
                            backgroundColor: AppColors.greenColor,
                            label: Text(
                              ProductTabViewModel.get(context)
                                  .cartCounter
                                  .toString(),
                            ),
                            child: ImageIcon(
                              const AssetImage(AppAssets.shoppingCart),
                              size: 35.sp,
                              color: AppColors.primaryColor,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }
}
