import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/features/ui/widgets/custom_txt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  ProductDataEntity productDataEntity;
  ProductTabItem({Key? key, required this.productDataEntity}) : super(key: key);

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
                  imageUrl: productDataEntity.imageCover ?? '',
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
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          //todo: add to fav
                        },
                        color: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                        iconSize: 30.r,
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.primaryColor,
                        )),
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
                  text: productDataEntity.title ?? "",
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    CustomTxt(text: "EGP ${productDataEntity.price}"),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomTxt(
                      text: "EGP ${productDataEntity.price! * 2}",
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
                      text: "Review (${productDataEntity.ratingsAverage})",
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
