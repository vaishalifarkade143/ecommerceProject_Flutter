
import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/features/authentication/screens/onbording/onboarding.dart';
import 'package:ecommerseproject/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/signup.dart';
import 'package:ecommerseproject/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ecommerseproject/features/personalization/screen/address/address.dart';
import 'package:ecommerseproject/features/personalization/screen/profile/profile.dart';
import 'package:ecommerseproject/features/personalization/screen/settings/settings.dart';
import 'package:ecommerseproject/features/shop/screens/cart/cart.dart';
import 'package:ecommerseproject/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerseproject/features/shop/screens/home/home.dart';
import 'package:ecommerseproject/features/shop/screens/order/order.dart';
import 'package:ecommerseproject/features/shop/screens/product_reviews/product_review.dart';
import 'package:ecommerseproject/features/shop/screens/store/store.dart';
import 'package:ecommerseproject/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerseproject/routes/routes.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name : TRoutes.home,page :() => const HomeScreen()),
    GetPage(name : TRoutes.store,page :() => const StoreScreen()),
    GetPage(name : TRoutes.favourites,page :() => const FavouriteScreen()),
    GetPage(name : TRoutes.setting,page :() => const SettingsScreen()),
    GetPage(name : TRoutes.productReviews,page :() => const ProductReviewScreen()),
    GetPage(name : TRoutes.orders,page :() => const OrderScreen()),
    GetPage(name : TRoutes.checkout,page :() => const CheckoutScreen()),
    GetPage(name : TRoutes.cart,page :() => const CartScreen()),
    GetPage(name : TRoutes.userProfile,page :() => const ProfileScreen()),
    GetPage(name : TRoutes.userAddress,page :() => const UserAddressScreen()),
    GetPage(name : TRoutes.signUp,page :() => const SignUpScreen()),
    GetPage(name : TRoutes.verifyEmail,page :() => const VerifyEmailScreen()),
    GetPage(name : TRoutes.signIn,page :() => const LoginScreen()),
    GetPage(name : TRoutes.forgetPassword,page :() => const ForgetPassword()),
    GetPage(name : TRoutes.onBoarding,page :() => const OnBoardingScreen()),

  ];
}