import 'package:get/get.dart';
import 'package:starwars/core/bindings/injector_factory.dart';
import 'package:starwars/home/domain/use_cases/invaders/get_invaders.dart';
import 'package:starwars/home/presentation/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final invaderRepository = InjectorFactory.createInvasorRepository();

    final useCaseGetInvaders = GetInvaders(repository: invaderRepository);
    Get.lazyPut<HomeController>(
        () => HomeController(useCaseGetInvaders: useCaseGetInvaders));
  }
}
