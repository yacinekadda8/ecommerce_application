class AppLink {
  static const String server = "http://192.168.1.67/ecommercecourse";
  static const String imagestatic =
      "http://192.168.1.67/ecommercecourse/upload";

  // ================================= images ========================== //

  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resendcode = "$server/auth/resendcode.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
// ================================= home ========================== //
  static const String homepage = "$server/home.php";

// ================================= items ========================== //
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  static const String offers = "$server/items/offers.php";

// ================================= favorites ========================== //
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoritesView = "$server/favorite/view.php";
  static const String deletefromfavorires =
      "$server/favorite/deletefromfavorires.php";

// ========================= cart  ========================== //
  static const String cartAdd = "$server/cart/add.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String itemsCardCount = "$server/cart/getitemscount.php";
}
