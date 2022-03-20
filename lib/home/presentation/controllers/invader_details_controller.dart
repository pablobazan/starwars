import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/domain/use_cases/invaders/post_invader_report.dart';

class InvaderDetailsController extends GetxController {
  PostInvaderReport useCasePostInvaderReport;

  InvaderDetailsController(this.useCasePostInvaderReport);

  late Invader _invader;
  Invader get invader => _invader;

  bool isSendingReport = false;

  @override
  void onInit() {
    _invader = Get.arguments;
    super.onInit();
  }

  void sendReport() async {
    if (isSendingReport) return;
    isSendingReport = true;
    final result = await useCasePostInvaderReport.call(
      Params(
        userId: 1,
        dateTime: DateTime.now().toString(),
        characterName: _invader.name,
      ),
    );

    result.fold((error) {}, (invaderReport) {
      Get.snackbar(Strings.invaderReported, Strings.rebelionShip,
          backgroundColor: greenFlourescentColor,
          borderColor: Colors.black,
          borderWidth: 2);
    });
    isSendingReport = false;
  }
}
