import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/widgets/app_bar.dart';
import 'package:starwars/core/widgets/loading_page.dart';
import 'package:starwars/home/presentation/controllers/home_controller.dart';
import 'package:starwars/home/presentation/widgets/empty_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const StarWarsAppBar(),
      body: controller.obx((_) => _Content(),
          onLoading: LoadingWidget(), onEmpty: EmptyPage()),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) => Container(
                height: 16.h,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        Strings.wanted,
                        style: Styles.cardTitleStyle(),
                      )),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15.w,
                            height: 8.h,
                            child: SvgPicture.asset(
                              'assets/icons/wanted.svg',
                              color: greenFlourescentColor,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Strings.name} Pablo Martin Bazán',
                                style: Styles.cardTagStyle(),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                '${Strings.name} 1.85m',
                                style: Styles.cardTagStyle(),
                              ),
                            ],
                          ),
                          Container(
                            color: greenFlourescentColor,
                            height: 7.h,
                            width: 1,
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Strings.weight} 70Kg',
                                style: Styles.cardTagStyle(),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                '${Strings.sex} MALE',
                                style: Styles.cardTagStyle(),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      bottom:
                          BorderSide(color: greenFlourescentColor, width: 0.5),
                      left:
                          BorderSide(color: greenFlourescentColor, width: 0.5),
                      right:
                          BorderSide(color: greenFlourescentColor, width: 0.5),
                      top: BorderSide(color: greenFlourescentColor, width: 0.5),
                    )),
              )),
    );
  }
}
