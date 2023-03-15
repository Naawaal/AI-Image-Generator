import 'package:ai_image_generator/app/routes/routes_name.dart';
import 'package:ai_image_generator/app/ui/pages/01_homepage/homepage_screen.dart';
import 'package:ai_image_generator/app/ui/pages/02_art_page/art_screen.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.homepageScreen,
          page: () => const HomepageScreen(),
          title: 'Splash Screen',
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.artScreen,
          page: () => const ArtScreen(),
          title: 'Art Screen',
          transition: Transition.rightToLeft,
        ),
      ];
}
