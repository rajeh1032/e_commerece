import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' as productDataEntity;
import 'package:e_commerece/core/utils/app_assets.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatefulWidget {
  final GetFavoriteDataEntity product;
  String heartIcon = AppAssets.selectedFavouriteIcon;

  bool isClicked = false;

  FavoriteItem({super.key, required this.product});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.productRoute);
        },
        child: Container(
          height: 135.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.primaryColor)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(.6),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    width: 120.w,
                    height: 135.h,
                    fit: BoxFit.cover,
                    //todo: add image
                    imageUrl: widget.product.imageCover!,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 8.h, left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            //todo : add title
                            widget.product.title!.length > 20
                                ? widget.product.title!.substring(0, 12) + "..."
                                : widget.product.title!,
                            style: AppStyles.medium18Header,
                          ),
                          InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            onTap: () {
                              //todo: add favorite
                              setState(() {
                                widget.isClicked = !widget.isClicked;
                                widget.heartIcon = !widget.isClicked
                                    ? AppAssets.selectedFavouriteIcon
                                    : AppAssets.selectedAddToFavouriteIcon;
                                if (widget.isClicked) {
                                  FavoriteTabViewModel.get(context)
                                      .addItemFavorite(
                                          productId: widget.product.id!);
                                } else {
                                  FavoriteTabViewModel.get(context)
                                      .removeItemFavorite(
                                          productId: widget.product.id!);
                                }
                              });
                            },
                            child: Material(
                              color: AppColors.whiteColor,
                              elevation: 5,
                              shape: const StadiumBorder(),
                              shadowColor: AppColors.blackColor,
                              child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: ImageIcon(
                                    AssetImage(widget.heartIcon),
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "EGP ${widget.product.price!}",
                          style: AppStyles.medium18Header,
                        ),
                        AutoSizeText(
                          "EGP${widget.product.price! * 2}",
                          style: AppStyles.regular11SalePrice
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 100.w,
                          height: 36.h,
                          child: CustomElevatedButton(
                              text: "Add To Cart",
                              onPressed: () {
                                //   todo add to cart
                                ProductTabViewModel.get(context).addToCart(
                                    productId: widget.product.id ?? '');
                              },
                              backgroundColor: AppColors.primaryColor,
                              textStyle: AppStyles.medium14Category
                                  .copyWith(color: AppColors.whiteColor)),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
