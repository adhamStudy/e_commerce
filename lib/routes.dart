
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/middleware/my_middleware.dart';

import 'package:e_commerce/my_binding.dart';
import 'package:e_commerce/view/address/address_add.dart';
import 'package:e_commerce/view/address/address_add_details.dart';
import 'package:e_commerce/view/address/address_edit.dart';
import 'package:e_commerce/view/address/address_view.dart';
import 'package:e_commerce/view/screen/auth/check_email_view.dart';
import 'package:e_commerce/view/screen/auth/forgtpassword/forget_password_view.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/forgtpassword/reset_password_view.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/forgtpassword/success_reset_password.dart';
import 'package:e_commerce/view/screen/auth/success_signup_view.dart';
import 'package:e_commerce/view/screen/auth/forgtpassword/verify_code_view.dart';
import 'package:e_commerce/view/screen/auth/verify_code_signup.dart';
import 'package:e_commerce/view/screen/cart.dart';
import 'package:e_commerce/view/screen/checkout.dart';

import 'package:e_commerce/view/screen/home/favorites.dart';
import 'package:e_commerce/view/screen/home/items.dart';
import 'package:e_commerce/view/screen/home/product_details.dart';
import 'package:e_commerce/view/screen/home/settings.dart';
import 'package:e_commerce/view/screen/home_screen.dart';
import 'package:e_commerce/view/screen/language.dart';

import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:e_commerce/view/screen/orders/pending.dart';
// import 'package:e_commerce/view/test_view.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';


List<GetPage<dynamic>>? routesList = [
  // GetPage(name: '/', page: () => const TestView()),
  GetPage(name: '/', page: () => LanguageView(), middlewares: [MyMiddleWare()]),
  // GetPage(name: '/', page: () => const Cart()),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginView(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const Signupview(),
    binding: MyBinding(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPasswordView(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordView(),
  ),
  GetPage(
    name: AppRoute.verifyCode,
    page: () => const VerifyCodedView(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignup,
    page: () => const VerifyCodeSignupView(),
  ),
  GetPage(
    name: AppRoute.successReset,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.successSignup,
    page: () => const SuccessSignedUp(),
  ),
  GetPage(
    name: AppRoute.checkEmail,
    page: () => const CheckEmailView(),
  ),
  GetPage(
    name: AppRoute.onboarding,
    page: () => const OnBoarding(),
  ),
  // ======================= home ======================
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.items,
    page: () => const Items(),
  ),
  GetPage(
    name: AppRoute.productsDetails,
    page: () => const ProductDetails(),
  ), 
   GetPage(
    name: AppRoute.myFavorite,
    page: () => const MyFavorite(),
  ),
   GetPage(
    name: AppRoute.settings,
    page: () => const 
      SettignsView(),
  ),
   GetPage(
    name: AppRoute.cart,
    page: () => const 
      Cart(),
  ),
  // ==================== address =======================
   GetPage(
    name: AppRoute.addressAdd,
    page: () => const AddressAdd(),
  ),
   GetPage(
    name: AppRoute.addressEdit,
    page: () => const 
      AddressEdit(),
  ),
   GetPage(
    name: AppRoute.addressHome,
    page: () => const 
      AddressView(),
  ),

   GetPage(
    name: AppRoute.addressAddDetails,
    page: () => const 
      AddressAddDetails(),
  ),
  GetPage(
    name: AppRoute.checkout,
    page: () => const 
      CheckoutPage(),
  ),
  GetPage(
    name: AppRoute.ordersPending,
    page: () => const 
      OrdersPending(),
  ),
 
];

// Map<String, Widget Function(BuildContext)> routes = {
//   // auth routes
//   AppRoute.login: (p0) => const LoginView(),
//   AppRoute.signup: (p0) => const Signupview(),
//   AppRoute.forgetPassword: (p0) => const ForgetPasswordView(),
//   AppRoute.resetPassword: (p0) => const ResetPasswordView(),
//   AppRoute.verifyCode: (p0) => const VerifyCodedView(),
//   AppRoute.verifyCodeSignup: (p0) => const VerifyCodeSignupView(),
//   AppRoute.successReset: (p0) => const SuccessResetPassword(),
//   AppRoute.successSignup: (p0) => const SuccessSignedUp(),
//   AppRoute.checkEmail: (p0) => const CheckEmailView(),
//   // on  boarding
//   AppRoute.onboarding: (p0) => const OnBoarding(),
// };
