import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  CategoryBrandItem({required this.categoryList, super.key});
  CategoryOrBrandDataEntity categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            height: 10.h,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: categoryList.image!,
            imageBuilder: (context, ImageProvider) {
              return CircleAvatar(
                backgroundImage: ImageProvider,
                radius: 50.r,
              );
            },
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
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 4,
            child: Text(
              //todo: add item name
              categoryList.name!,
              textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
