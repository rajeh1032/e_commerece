import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/core/utils/dialog_utils.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  ProductTab({super.key});
  late ProductTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ProductTabViewModel>(context);
    return BlocConsumer(
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
      bloc: viewModel..getProducts(),
      buildWhen: (previous, current) =>
          current is ProductLoadingState ||
          current is ProductSuccessState ||
          current is ProductErrorState,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductErrorState) {
          return Center(child: Text(state.failures.errorMessage.toString()));
        }
        if (state is ProductSuccessState) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3.2.h,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                      ),
                      itemCount: viewModel.productList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo: navigate  Product Details
                          },
                          child: ProductTabItem(
                            productDataEntity: viewModel.productList[index],
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
