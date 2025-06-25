import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/core/utils/dialog_utils.dart';
import 'package:e_commerece/core/utils/validators.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerece/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerece/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_assets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  // RegisterViewModel(registerUseCase: registerUseCase);
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: 'Error',
              posActionName: 'ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'ok',
              posAction: () {
                //               //todo: save token in shared pref

                SharedPreferenceUtils.saveData(
                    key: 'token', value: state.registerResponseEntity.token);

                //todo: navigate to home screen

                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 10.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  AppAssets.appBarLeading,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Full Name",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.name,
                              isObscureText: false,
                              hintText: "enter your full name",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.fullNameControler,
                              validator: AppValidators.validateFullName,
                            ),
                            Text(
                              "Mobile Number",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                                isPassword: false,
                                keyboardType: TextInputType.phone,
                                isObscureText: false,
                                hintText: "enter your mobile number",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.phoneControler,
                                validator: AppValidators.validatePhoneNumber),
                            Text(
                              "E-mail address",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                                isPassword: false,
                                keyboardType: TextInputType.emailAddress,
                                isObscureText: false,
                                hintText: "enter your email address",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.mailControler,
                                validator: AppValidators.validateEmail),
                            Text(
                              "Password",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "enter your password",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.passwordControler,
                              validator: AppValidators.validatePassword,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.visibility_off)),
                            ),
                            Text(
                              "Re-Password",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "enter your re-password",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.rePasswordControler,
                              validator: AppValidators.validatePassword,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.visibility_off)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  textStyle: AppStyles.semi20Primary,
                                  text: "Sign up",
                                  onPressed: () {
                                    viewModel.register();
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.loginRoute);
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        'Already have an account? login',
                                        style: AppStyles.medium18White,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
