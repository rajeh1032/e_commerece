import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/core/utils/dialog_utils.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_states.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece/features/ui/widgets/cart_item.dart';
import 'package:e_commerece/features/ui/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context),
      body: BlocBuilder<CartScreenViewModel, CartScreenStates>(
     
          bloc: CartScreenViewModel.get(context)..getCartItems(),
          builder: (context, state) {
            if (state is CartScreenSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.getCartResponseEntity.data!.products!.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItems: state
                              .getCartResponseEntity.data!.products![index],
                        );
                      },
                    ),
                  ),
                  _buildCheckOut(
                      context,
                      state.getCartResponseEntity.data!.totalCartPrice!
                          .toDouble())
                ],
              );
            } else if (state is CartScreenErrorState) {
              return Center(
                  child: Text(
                state.failures.errorMessage,
                style: AppStyles.medium14PrimaryDark,
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          }),
    );
  }
}

PreferredSizeWidget _customAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    toolbarHeight: 50.h,
    centerTitle: true,
    elevation: 0,
    title: const Text("Cart"),
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.primaryColor,
    titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          size: 35.sp,
          color: AppColors.primaryColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: const Icon(Icons.shopping_cart),
      ),
    ],
  );
}

Widget _buildCheckOut(BuildContext context, double price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
    child: Row(
      children: [
        Column(
          children: [
            CustomTxt(text: 'Total Price'),
            CustomTxt(
              text: "$price",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                onPressed: () {
                  //todo : navigate to payment section
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTxt(
                      text: 'Check Out',
                      fontColor: AppColors.whiteColor,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.whiteColor,
                      size: 28.sp,
                    ),
                  ],
                )))
      ],
    ),
  );
}
