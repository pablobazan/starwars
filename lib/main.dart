import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/platform/injector_factory.dart';
import 'package:starwars/core/platform/main_services.dart';
import 'package:starwars/core/presentation/navigation/routes.dart';
import 'package:starwars/core/widgets/internet_drawer/bloc/internet_drawer_bloc.dart';
import 'package:starwars/home/domain/use_cases/invaders/get_invaders.dart';
import 'package:starwars/home/domain/use_cases/invaders/post_invader_report.dart';
import 'package:starwars/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:starwars/home/presentation/bloc/invader_details_bloc/invader_details_bloc.dart';
import 'package:starwars/home/presentation/widgets/loading_fade_in_up/bloc/loading_fade_in_up_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainServices().init();

  runApp(StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  StarWarsApp({Key? key}) : super(key: key);

  final invasorRepository = InjectorFactory.createInvasorRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
              useCaseGetInvaders: GetInvaders(repository: invasorRepository)),
        ),
        BlocProvider(create: (context) => InternetDrawerBloc()),
        BlocProvider(
            create: ((context) => InvaderDetailsBloc(
                useCasePostInvaderReport:
                    PostInvaderReport(repository: invasorRepository)))),
        BlocProvider(create: (context) => LoadingFadeInUpBloc()),
      ],
      child: const StarWarsMaterialApp(),
    );
  }
}

class StarWarsMaterialApp extends StatelessWidget {
  const StarWarsMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        routes: Pages.routes,
        theme: ThemeData.light().copyWith(
            textTheme:
                GoogleFonts.bebasNeueTextTheme(Theme.of(context).textTheme)),
      );
    });
  }
}
