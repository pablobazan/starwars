import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/widgets/app_bar.dart';
import 'package:starwars/home/presentation/controllers/invader_details_controller.dart';

class InvaderDetailsPage extends GetView<InvaderDetailsController> {
  const InvaderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: const StarWarsAppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Hero(
                  tag: controller.invader.url,
                  child: SvgPicture.asset(
                    'assets/icons/wanted.svg',
                    color: greenFlourescentColor,
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  controller.invader.name,
                  style: Styles.nameDetailStyle(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 60,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Strings.height} ${controller.invader.height} cm',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.weight} ${controller.invader.mass} kg',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.sex} ${controller.invader.gender}',
                                style: Styles.cardTitleStyle(),
                              ),
                            ],
                          )),
                      Flexible(
                          flex: 40,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Strings.hairColor} ${controller.invader.hairColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.skinColor} ${controller.invader.skinColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.eyeColor} ${controller.invader.eyeColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: MaterialButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.w, vertical: 2.h),
                      color: greenFlourescentColor,
                      focusElevation: 0.0,
                      onPressed: () => controller.sendReport(),
                      child: Text(
                        Strings.report,
                        style: Styles.textReportStyle(),
                      )),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: greenFlourescentColor.withOpacity(0.1),
                border: const Border(
                  bottom: BorderSide(color: greenFlourescentColor, width: 0.5),
                  left: BorderSide(color: greenFlourescentColor, width: 0.5),
                  right: BorderSide(color: greenFlourescentColor, width: 0.5),
                  top: BorderSide(color: greenFlourescentColor, width: 0.5),
                )),
          ),
        ));
  }
}
