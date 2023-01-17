import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/utils/assets_path.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key, required this.retryInvaders}) : super(key: key);

  final VoidCallback retryInvaders;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SvgPicture.asset(
            AssetsPath.tropper,
            color: AppColors.greenFlourescentColor,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            Strings.noInvaders,
            style: Styles.vaderIsWatchingTextStyle(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                color: AppColors.greenFlourescentColor,
                focusElevation: 0.0,
                onPressed: () => retryInvaders(),
                child: Text(
                  Strings.retryInvaders,
                  style: Styles.textReportStyle(),
                )),
          ),
        ],
      ),
    );
  }
}
