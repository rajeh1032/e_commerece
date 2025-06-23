import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          _buildImageSlideShow(images: viewModel.images),
          SizedBox(
            height: 24.h,
          ),
          _lineBreak(name: "Categories"),
          // _buildCategoryBrandSec(CategoryBrandItem(
          //   image: viewModel.categoriesList[selectedIndex].image ?? "",
          //   title: viewModel.categoriesList[selectedIndex].name ?? "",
          // )),
          BlocBuilder(

              //معنها يرجع view model بعد ما ينادي ع الفانكشن
              bloc: viewModel..getAllCategory(),
              buildWhen: (previous, current) =>
                  current is CategoryLoadingState ||
                  current is CategorySuccessState ||
                  current is CategoryErrorState,
              builder: (context, state) {
                // return viewModel.categoriesList.isNotEmpty
                //     ? _buildCategoryBrandSec(List: viewModel.categoriesList)
                //     : const Center(
                //         child: CircularProgressIndicator(
                //           color: AppColors.primaryColor,
                //         ),
                //       );

                ///or
                if (state is CategoryLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else if (state is CategoryErrorState) {
                  return Text(
                    state.failures.errorMessage,
                    style: AppStyles.medium18Header
                        .copyWith(color: AppColors.primaryColor),
                  );
                } else if (state is CategorySuccessState) {
                  return _buildCategoryBrandSec(
                      List: state.getAllCategoryResponseEntity
                          .data! // || viewModel.categoryList
                      );
                }
                return Container();
              }),

          _lineBreak(name: "Brands"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllBrand(),
            buildWhen: (previous, current) =>
                current is BrandLoadingState ||
                current is BrandSuccessState ||
                current is BrandErrorState,
            builder: (context, state) {
              if (state is BrandLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (state is BrandErrorState) {
                return Text(
                  state.failures.errorMessage,
                  style: AppStyles.medium18Header
                      .copyWith(color: AppColors.primaryColor),
                );
              } else if (state is BrandSuccessState) {
                return _buildCategoryBrandSec(
                    List: state.getAllCategoryOrBrandResponseEntity
                        .data! // || viewModel.categoryList
                    );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  ImageSlideshow _buildImageSlideShow({required List<String> images}) {
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        height: 190.h,
        children: images.map((url) {
          return Image.asset(url, fit: BoxFit.cover);
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppStyles.medium18Header,
        ),
        TextButton(
            onPressed: () {
              //todo navigate to all
            },
            child: Text(
              "View All",
              style: AppStyles.regular12Text,
            ))
      ],
    );
  }

  SizedBox _buildCategoryBrandSec(
      {required List<CategoryOrBrandDataEntity> List}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
          ),
          itemCount: viewModel.categoriesList.length,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryBrandItem(categoryList: List[index]);
          }),
    );
  }
}
