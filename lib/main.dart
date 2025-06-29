import 'dart:io';

import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_theme.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:e_commerece/core/utils/my_bloc_observer.dart';
import 'package:e_commerece/core/utils/di/di.dart';
import 'package:e_commerece/features/cart_screen/cart_screen.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece/features/ui/auth/login/login_screen.dart';
import 'package:e_commerece/features/ui/auth/register/register_screen.dart';
import 'package:e_commerece/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);

  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  String routeName;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductTabViewModel>()),
        BlocProvider(create: (context) => getIt<CartScreenViewModel>()),
        BlocProvider(create: (context) => getIt<FavoriteTabViewModel>()),
      ],
      child: MyApp(
        routeName: routeName,
      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.routeName});
  String routeName;

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
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.cartRoute: (context) => CartScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
