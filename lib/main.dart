import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_theme.dart';
import 'package:e_commerece/core/utils/my_bloc_observer.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/features/ui/auth/login/login_screen.dart';
import 'package:e_commerece/features/ui/auth/register/register_screen.dart';
import 'package:e_commerece/features/ui/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
