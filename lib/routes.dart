import 'package:get/get.dart';
import 'view/screen/partner/partner_upload_story/upload_text.dart';
import 'view/screen/partner/partner_upload_story/partner_upload_story.dart';
import 'view/screen/partner/partner_replacement_award/partner_replacement_award.dart';

import 'core/constant/routes.dart';
import 'core/middleware/home_middleware.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/partner/partner_awards/partner_awards.dart';
import 'view/screen/partner/partner_coupon/partner_coupon.dart';
import 'view/screen/partner/partner_details/partner_details.dart';
import 'view/screen/partner/partner_home/partner_home.dart';
import 'view/screen/partner/qr_scanner/qr_scanner.dart';
import 'view/screen/user/auth/login.dart';
import 'view/screen/user/auth/register.dart';
import 'view/screen/user/awards/awards.dart';
import 'view/screen/user/best_of/best_of.dart';
import 'view/screen/user/coupon/coupon.dart';
import 'view/screen/user/favorite/favorite_view.dart';
import 'view/screen/user/main_screen/main_screen.dart';
import 'view/screen/user/my_points/my_points.dart';
import 'view/screen/user/post/post.dart';
import 'view/screen/user/reels/splah_reels.dart';
import 'view/screen/user/splash/splash_screen.dart';
import 'view/screen/user/sub_category/sub_category.dart';
import 'view/widget/home/story/story_viewr.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const SplashScreenViewer(), middlewares: [
    MyMiddleWare(),
    HomeMiddleware(),
  ]),
  GetPage(name: AppRoutes.home, page: () => const MainScreen(), middlewares: [
    HomeMiddleware(),
  ]),
  GetPage(name: AppRoutes.mainScreen, page: () => const MainScreen()),
  GetPage(name: AppRoutes.splash, page: () => const SplashScreenViewer()),
  GetPage(name: AppRoutes.subCategory, page: () => const SubCategory()),
  GetPage(name: AppRoutes.post, page: () => const Post()),
  GetPage(name: AppRoutes.splashReel, page: () => const SplashReels()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.register, page: () => const Register()),
  GetPage(name: AppRoutes.bestOf, page: () => const BestOf()),
  GetPage(name: AppRoutes.favoriteReels, page: () => const FavoriteReelsView()),
  GetPage(name: AppRoutes.coupon, page: () => const Coupon()),
  GetPage(name: AppRoutes.myPoints, page: () => const MyPoints()),
  GetPage(name: AppRoutes.awards, page: () => const Awards()),
  GetPage(name: AppRoutes.storyView, page: () => const AppStoryView()),
  GetPage(name: AppRoutes.partnerHome, page: () => const PartnerHome()),
  GetPage(name: AppRoutes.partnerDetails, page: () => const PartnerDetails()),
  GetPage(name: AppRoutes.qrScanner, page: () => const QRMobileScanner()),
  GetPage(name: AppRoutes.qrScannerAwards, page: () => const QRMobileScanner()),
  GetPage(name: AppRoutes.partnerCoupon, page: () => const PartnerCoupon()),
  GetPage(name: AppRoutes.partnerAwards, page: () => const PartnerAwards()),
  GetPage(
      name: AppRoutes.partnerReplacementAwards,
      page: () => const PartnerReplacementAwards()),
  GetPage(name: AppRoutes.uploadStory, page: () => const PartnerUploadStory()),
  GetPage(name: AppRoutes.uploadText, page: () => const PartnerUploadText()),
];
