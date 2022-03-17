import 'package:get/get.dart';
import 'package:starwars/home/domain/use_cases/invaders/get_invaders.dart';

class HomeController extends GetxController with StateMixin {
  final GetInvaders useCaseGetInvaders;

  HomeController({required this.useCaseGetInvaders});

  @override
  void onReady() async {
    await getInvasors();
    super.onReady();
  }

  Future<void> getInvasors() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(Duration(seconds: 15));
    change(null, status: RxStatus.empty());
    await Future.delayed(Duration(seconds: 10));
    change(null, status: RxStatus.success());

    // final
  }
}
