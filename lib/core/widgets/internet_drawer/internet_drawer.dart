import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/widgets/internet_drawer/internet_drawer_controller.dart';

class InternetDrawer extends StatelessWidget {
  InternetDrawer({Key? key}) : super(key: key);

  final controller =
      Get.put<InternetDrawerController>(InternetDrawerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 40.w,
        child: Drawer(
          child: Container(
              width: 40.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                child: Column(
                  children: [
                    Container(
                      color: greenFlourescentColor.withOpacity(0.8),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(Strings.connection,
                              textAlign: TextAlign.center),
                          Obx(
                            () => Switch(
                                activeColor: Colors.black,
                                value: controller.enableInternet.value,
                                onChanged: (value) {
                                  controller.changeInternetConnection(value);
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.black, //,
                  border: Border(
                    bottom:
                        BorderSide(color: greenFlourescentColor, width: 0.5),
                    left: BorderSide(color: greenFlourescentColor, width: 0.5),
                    top: BorderSide(color: greenFlourescentColor, width: 0.5),
                  ))),
        ),
      ),
    );
  }
}
