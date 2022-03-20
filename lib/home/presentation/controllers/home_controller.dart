import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars/core/presentation/navigation/routes.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/use_cases/invaders/get_invaders.dart';

class HomeController extends GetxController with StateMixin<InvaderList> {
  final GetInvaders useCaseGetInvaders;

  late InvaderList _invaders;
  get invaders => _invaders;

  int _page = 1;
  bool lastPage = false;
  final RxBool _loadingMoreInvasors = false.obs;
  get loadingMoreInvasors => _loadingMoreInvasors;

  late ScrollController _scrollController;
  get scrollController => _scrollController;

  late AnimationController animationController;

  HomeController({required this.useCaseGetInvaders});

  @override
  void onReady() async {
    await getInvasors();
    initScrollScontroller();
    super.onReady();
  }

  Future<void> getInvasors() async {
    change(null, status: RxStatus.loading());

    _page = 1;
    final result = await useCaseGetInvaders.call(Params(page: _page));
    result.fold((failure) {
      change(null, status: RxStatus.error());
    }, (invaderList) {
      _invaders = invaderList;

      if (_invaders.invaders.isNotEmpty) {
        change(_invaders, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    });
  }

  Future<void> loadMoreInvasors() async {
    if (lastPage) return;
    _loadingMoreInvasors.value = true;
    animateLoading();
    final result = await useCaseGetInvaders.call(Params(page: ++_page));
    result.fold((failure) {
      change(null, status: RxStatus.error());
    }, (invaderList) {
      _invaders.invaders.addAll(invaderList.invaders);
      lastPage = invaderList.next == null;
      change(_invaders, status: RxStatus.success());
    });
    _loadingMoreInvasors.value = false;
    update();
  }

  initScrollScontroller() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreInvasors();
      }
    });
  }

  void nextPage(int index) {
    Get.toNamed(Routes.invaderDetail, arguments: _invaders.invaders[index]);
  }

  void animateLoading() {
    if (animationController.isCompleted) {
      animationController.reset();
    }
    animationController.forward();
  }
}
