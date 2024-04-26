class AppLink {
  static const String server = 'https://phptrain.u4e.net/ecommerce_flutter';
  static const String imageStatic =
      'https://phptrain.u4e.net/ecommerce_flutter/upload';
  static const String imageCategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';
  static const String test = '$server/test.php';
  // -===================================== Auth ====================
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verifycode = '$server/auth/verify_code.php';
  static const String verifycodeResetPassword =
      '$server/auth/forget_password/verify_code.php';
  static const String checkEmail =
      '$server/auth/forget_password/check_email.php';
  static const String resetPassword =
      '$server/auth/forget_password/reset_password.php';
  static const String resendUserVerifyCode =
      '$server/auth/resend_verification_code.php';

  //======================================= home
  static const String home = '$server/home.php';
  static const String items = '$server/items/items.php';
  static const String search = '$server/items/search.php';

  // ====================================== favorite
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String deleteFromFavorite = '$server/favorite/delete.php';
  static const String myFavorite = '$server/favorite/view.php';

  // ====================================== cart
  static const String cartAdd = '$server/cart/add.php';
  static const String cartRemove = '$server/cart/remove.php';
  static const String cartView = '$server/cart/view.php';
  static const String cartGetCountItem = '$server/cart/get_count_item.php';

  // ===================================== address
  static const String addressAdd = '$server/address/add.php';
  static const String addressView = '$server/address/view.php';
  static const String addressDelete = '$server/address/delete.php';

  // ===================================== address
  static const String checkCoupon = '$server/coupon/check_coupon.php';

  // ===================================== checkout
  static const String checkoutLink = '$server/orders/checkout.php';
    static const String ordersPending = '$server/orders/pending.php';
  static const String finishCheckout = 'https://phptrain.u4e.net/ecommerce_flutter/orders/checkout.php';
}
