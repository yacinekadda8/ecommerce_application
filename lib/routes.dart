import 'package:ecommerce_application/core/constant/routes.dart';
import 'package:ecommerce_application/core/middleware/mymiddleware.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/forgetpassword_cheekemail.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/success_signup.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_application/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_application/view/screen/homescreen.dart';
import 'package:ecommerce_application/view/screen/itemdetails.dart';
import 'package:ecommerce_application/view/screen/items.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:ecommerce_application/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const ItemDetails()),
  /* GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]), */
  // GetPage(name: "/", page: () => TestView()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
];
