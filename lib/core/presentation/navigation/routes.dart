import 'package:get/get.dart';
import 'package:starwars/home/bindings/home_bindings.dart';
import 'package:starwars/home/presentation/pages/home_page.dart';

class Routes {
  static const String home = '/home';
  static const String detail = '/detail';
}

class Pages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBindings())
  ];
}
