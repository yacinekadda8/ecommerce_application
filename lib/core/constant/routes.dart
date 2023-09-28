import 'package:ecommerce_application/core/constant/approutes.dart';
import 'package:ecommerce_application/core/middleware/mymiddleware.dart';
import 'package:ecommerce_application/view/screen/address/address_add.dart';
import 'package:ecommerce_application/view/screen/address/addaddress_details.dart';
import 'package:ecommerce_application/view/screen/address/address_view.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/forgetpassword_cheekemail.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/success_signup.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_application/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_application/view/screen/cart.dart';
import 'package:ecommerce_application/view/screen/checkout.dart';
import 'package:ecommerce_application/view/screen/homescreen.dart';
import 'package:ecommerce_application/view/screen/itemdetails.dart';
import 'package:ecommerce_application/view/screen/items.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:ecommerce_application/view/screen/myfavorites.dart';
import 'package:ecommerce_application/view/screen/onboarding.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/details.dart';
import '../../view/screen/orders/my_orders.dart';
import '../../view/screen/orders/pending.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name: "/", page: () => const ItemDetails()),
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyMiddleWare()],
  ),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
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
  // home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemdetails, page: () => const ItemDetails()),
  GetPage(name: AppRoute.myfavorites, page: () => const Myfavorites()),

  //Address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressEdit, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addAddressDetails, page: () => const AddAddressDetails()),
  //checkout
  GetPage(
      name: AppRoute.checkout, page: () => const Checkout()),

  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.myorders, page: () => const MyOrders()),
  // GetPage(name: AppRoute.settings , page: () => const MySettings()),
  // GetPage(name: AppRoute.offers , page: () => const Offers()),
];
