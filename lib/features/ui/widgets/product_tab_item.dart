import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece/core/utils/app_assets.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/cache/hive_utils.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerece/features/ui/widgets/custom_txt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatefulWidget {
  ProductDataEntity productDataEntity;
  ProductTabItem({Key? key, required this.productDataEntity}) : super(key: key);


  @override
  State<ProductTabItem> createState() => _ProductTabItemState();
}

class _ProductTabItemState extends State<ProductTabItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfFavorite();
  }

  bool isFavorite = false;
  void checkIfFavorite() async {
    final fav = await HiveUtils().isFavorite(widget.productDataEntity.id!);
    setState(() {
      isFavorite = fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary30Opacity, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: widget.productDataEntity.imageCover ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 20.r,
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        isFavorite = !isFavorite;
                      });

                      if (isFavorite) {
                        await FavoriteTabViewModel.get(context).addItemFavorite(
                          productId: widget.productDataEntity.id!,
                        );
                      } else {
                        await FavoriteTabViewModel.get(context)
                            .removeItemFavorite(
                          productId: widget.productDataEntity.id!,
                        );
                      }

                      final updated = await HiveUtils()
                          .isFavorite(widget.productDataEntity.id!);
                      setState(() {
                        isFavorite = updated;
                      });
                    },
                    iconSize: 30.r,
                    padding: EdgeInsets.zero,
                    icon: ImageIcon(
                      AssetImage(
                        isFavorite
                            ? AppAssets.selectedAddToFavouriteIcon
                            : AppAssets.selectedFavouriteIcon,
                      ),
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text: widget.productDataEntity.title ?? "",
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    CustomTxt(text: "EGP ${widget.productDataEntity.price}"),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomTxt(
                      text: "EGP ${widget.productDataEntity.price! * 2}",
                      textStyle: AppStyles.regular11SalePrice
                          .copyWith(decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    CustomTxt(
                      text:
                          "Review (${widget.productDataEntity.ratingsAverage})",
                      fontSize: 12.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 25.sp,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                        ProductTabViewModel.get(context).addToCart(
                            productId: widget.productDataEntity.id ?? '');
                        print(
                            "counter of cart ${ProductTabViewModel.get(context).cartCounter}");
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
