import 'package:starwars/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:starwars/home/presentation/pages/invader_details_page.dart';

class Routes {
  static const String home = '/home';
  static const String invaderDetail = '/invaderDetail';
}

class Pages {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (_) => const HomePage(),
    Routes.invaderDetail: (_) => const InvaderDetailsPage(),
  };
}
