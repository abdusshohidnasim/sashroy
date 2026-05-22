// ignore_for_file: constant_identifier_names
const String url = "https://sashroy-backend.onrender.com/api/v1";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT =
      "Accept";
  static const APP_KEY =
      "App-Key";
  static const ACCEPT_LANGUAGE =
      "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE =
      "pt";
  static const APP_KEY_VALUE =
      String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE =
      "application/json";
  static const AUTHORIZATION =
      "Authorization";
  static const CONTENT_TYPE =
      "content-Type";
}

final class EndPoints {
  EndPoints._();
  //Auth Endpoints
  static String signUp() =>
      "/auth/signup";
  static String logIn() =>
      "/auth/login";

  ///profile
  static String profile() =>
      "/user/profile";

  // static String getShopByCategories(String slug) =>
  //     "/api/shop-categories/$slug/";

  static String example() =>
      "/api/";

  static String products(int pageNum, int perPage) =>
      "/products?page=$pageNum&per_page=$perPage";
  static String productDetails(int id) =>
      "/products/$id";
}
