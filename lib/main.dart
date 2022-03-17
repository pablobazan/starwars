import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/platform/main_binding.dart';
import 'package:starwars/core/presentation/navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MainBinding().init();
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Star Wars App',
        initialRoute: Routes.home,
        getPages: Pages.pages,
      );
    });
  }
}
