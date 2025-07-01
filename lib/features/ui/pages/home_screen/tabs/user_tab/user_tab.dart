import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:e_commerece/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerece/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatefulWidget {
  UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  TextEditingController fullNameController =
      TextEditingController(text: "Ahmed Rajeh");
  TextEditingController emailController =
      TextEditingController(text: "ahmed@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "1122345");
  TextEditingController phoneController =
      TextEditingController(text: "01123456789");

  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool phoneReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Your Full Name",
              style: AppStyles.medium14LightPrimary,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: fullNameReadOnly,
              keyboardType: TextInputType.name,
              controller: fullNameController,
              borderColor: AppColors.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    fullNameReadOnly = !fullNameReadOnly;
                    setState(() {});
                  },
                  icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your E-mail",
              style: AppStyles.medium14LightPrimary,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: emailReadOnly,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              borderColor: AppColors.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    emailReadOnly = !emailReadOnly;
                    setState(() {});
                  },
                  icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your password",
              style: AppStyles.medium14LightPrimary,
            ),
            CustomTextFormField(
              isPassword: true,
              isObscureText: true,
              readonly: passwordReadOnly,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              borderColor: AppColors.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    passwordReadOnly = !passwordReadOnly;
                    setState(() {});
                  },
                  icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your mobile number",
              style: AppStyles.medium14LightPrimary,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: phoneReadOnly,
              keyboardType: TextInputType.phone,
              controller: phoneController,
              borderColor: AppColors.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    phoneReadOnly = !phoneReadOnly;
                    setState(() {});
                  },
                  icon: Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            CustomElevatedButton(
                text: "Save",
                onPressed: () {
                  //todo : save
                },
                backgroundColor: AppColors.primaryColor,
                textStyle: AppStyles.regular18White),
            CustomElevatedButton(
                text: "Logout",
                onPressed: () {
                  //todo : logout
                },
                backgroundColor: AppColors.primaryColor,
                textStyle: AppStyles.regular18White)
          ],
        ),
      ),
    );
  }
}
