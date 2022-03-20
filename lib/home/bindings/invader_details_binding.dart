import 'package:get/get.dart';
import 'package:starwars/core/bindings/injector_factory.dart';
import 'package:starwars/home/domain/use_cases/invaders/post_invader_report.dart';

import 'package:starwars/home/presentation/controllers/invader_details_controller.dart';

class InvaderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    final invaderRepository = InjectorFactory.createInvasorRepository();

    final useCasePostInvaderReport =
        PostInvaderReport(repository: invaderRepository);
    Get.lazyPut<InvaderDetailsController>(
        () => InvaderDetailsController(useCasePostInvaderReport),
        fenix: true);
  }
}
