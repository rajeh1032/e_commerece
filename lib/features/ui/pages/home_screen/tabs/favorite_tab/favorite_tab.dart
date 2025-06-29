import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductTabViewModel, ProductTabStates>(
      listener: (context, state) {
        if (state is AddCarSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "✅ Product added to cart successfully!",
                style: AppStyles.medium18White,
              ),
              backgroundColor: AppColors.primaryColor.withOpacity(0.9),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          );
        }
      },
      builder: (context, productState) {
        return BlocBuilder<FavoriteTabViewModel, FavoriteTabStates>(
          bloc: FavoriteTabViewModel.get(context)..getItemFavorite(),
          builder: (context, state) {
            if (state is GetFavoriteSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => FavoriteItem(
                        product: FavoriteTabViewModel.get(context)
                            .favoriteItemList[index],
                      ),
                      itemCount: FavoriteTabViewModel.get(context)
                          .favoriteItemList
                          .length,
                    ),
                  ),
                ],
              );
            } else if (state is GetFavoriteErrorState) {
              return Center(
                child: Text(
                  state.failures.errorMessage,
                  style: AppStyles.medium14PrimaryDark,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        );
      },
    );
  }
}
