import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLink {
  AppLink._();

  static String server = dotenv.env['SERVER']!;
  static String images = dotenv.env['IMAGES']!;

//============================== Auth ========================================//
  static String authRegister = "$server/auth/register";
  static String authLogin = "$server/auth/login";
  static String authLogout = "$server/auth/logout";

//============================== Categories ==================================//
  static String categoriesIndex = "$server/category/";
  static String categoriesImages = "$images/Category/";

//============================== Sub Categories ==============================//
  static String subCategoriesIndex = "$server/subCategories/";
  static String subCategoriesTotalRating = "$server/TotalRating/";
  static String subCategoriesEvaluate = "$server/Evaluate/";
  static String subCategoriesFilterSubCategory = "$server/Filter_SubCategory/";
  static String subCategoriesImages = "$images/Client/SubCategory/";
  static String subCategoriesSuggest = "$server/suggestSubCategories";

//============================== Post ========================================//
  static String postIndex = "$server/posts/";
  static String postImages = "$images/Client/SubCategory/posts/";
  static String postShowInterAction = "$server/ShowInteractions/";
  static String postLike = "$server/Like/";
  static String postDisLike = "$server/DisLike/";
  static String postSuggest = "$server/suggestPosts";

//============================== Advertisement ===============================//
  static String advertisementIndex = "$server/advertisment/";
  static String advertisementImages = "$images/Advertisment/";

//================================ Video =====================================//
  static String videoIndex = "$server/videos/";
  static String videoLocation = "$images/Client/posts/";
  static String suggestReels = "$server/suggestReels";
//================================ Contact ===================================//
  static String contactIndex = "$server/contact/";

//================================ Favorite ==================================//
  static String addToFavorite = "$server/addFavorite/";
  static String getFavorite = "$server/favorites/";

//================================ Points ====================================//
  static String addPoints = "$server/point";
  static String getPoints = "$server/points/";
  static String getTotalPoints = "$server/TotalPoints/";

//================================ Coupon ====================================//
  static String getCoupon = "$server/coupons";
  static String getUserCoupon = "$server/UserCoupons/";
  static String replacementCoupon = "$server/ReplacementCoupon/";

//================================ Awards ====================================//
  static String getAwards = "$server/rewards";
  static String awardsStore = "$server/reward";
  static String awardsReplacement = "$server/ReplacementReward/";
  static String awardsImages = "${subCategoriesImages}Reward/";

//================================ Story =====================================//
  static String getStory = "$server/Stories";
  static String addStory = "$server/addStroy";
  static String incrementStory = "$server/increaseView/";
  static String storyImages = "${subCategoriesImages}Story/";

//================================ Partner ===================================//
  static String getPartnerPointsCount = "$server/getSubCategoryPoints/";
  static String getPartnerAwards = "$server/getSubCategoryRewards/";
  static String getPartnerReplacementAwards = "$server/getRewardsReplacement/";
  static String getPartnerCoupons = "$server/getSubCategoryCoupons/";
  static String getPartnerSummery = "$server/getSummary/";
  static String getPartnerSubCategories = "$server/clientSubCategories/";
//================================ Notifications =============================//
  static String sendNotifications = "$server/notification";
}
