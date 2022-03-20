import 'package:get/get.dart';
import 'package:starwars/home/bindings/home_bindings.dart';
import 'package:starwars/home/bindings/invader_details_binding.dart';
import 'package:starwars/home/presentation/pages/home_page.dart';
import 'package:starwars/home/presentation/pages/invader_details_page.dart';

class Routes {
  static const String home = '/home';
  static const String invaderDetail = '/invaderDetail';
}

class Pages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.invaderDetail,
        page: () => const InvaderDetailsPage(),
        binding: InvaderDetailsBinding())
  ];
}
