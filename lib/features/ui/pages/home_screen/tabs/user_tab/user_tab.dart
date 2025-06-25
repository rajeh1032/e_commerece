import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: TextButton(
              onPressed: () {
                //todo logout

                SharedPreferenceUtils.removeData(key: 'token');
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.loginRoute, (route) => false);
              },
              child: Icon(
                Icons.logout_outlined,
                color: AppColors.redColor,
                size: 100.sp,
              )),
        )
      ],
    );
  }
}
