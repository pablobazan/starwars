import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/widgets/app_bar.dart';
import 'package:starwars/core/widgets/internet_drawer/internet_drawer.dart';
import 'package:starwars/core/widgets/loading_page.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/presentation/controllers/home_controller.dart';
import 'package:starwars/home/presentation/widgets/card_wanted_invader_widget.dart';
import 'package:starwars/home/presentation/widgets/empty_page_widget.dart';
import 'package:starwars/home/presentation/widgets/error_page_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const StarWarsAppBar(),
      endDrawer: InternetDrawer(),
      body: controller.obx(
          (invaderList) =>
              _Content(invaderList: invaderList!, controller: controller),
          onLoading: const LoadingWidget(),
          onEmpty: EmptyPage(retryInvaders: () => controller.getInvasors()),
          onError: (error) => ErrorPage(
                retryConnection: () => controller.getInvasors(),
              )),
    );
  }
}

class _Content extends StatelessWidget {
  final InvaderList invaderList;
  final HomeController controller;
  const _Content({
    Key? key,
    required this.invaderList,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h),
      child: Stack(
        children: [
          GetBuilder<HomeController>(
            builder: (_) => ListView.builder(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: invaderList.invaders.length,
              itemBuilder: (_, index) => CardWantedInvader(
                invaderList: invaderList,
                index: index,
                nextPage: controller.nextPage,
              ),
            ),
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 300),
            animate: false,
            manualTrigger: true,
            controller: (animationController) =>
                controller.animationController = animationController,
            child: Obx(
              () => Offstage(
                  offstage: !controller.loadingMoreInvasors.value,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: const CircularProgressIndicator(
                          color: greenFlourescentColor,
                          backgroundColor: Colors.white),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
