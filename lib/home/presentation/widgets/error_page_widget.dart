import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/utils/assets_path.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.retryConnection}) : super(key: key);

  final VoidCallback retryConnection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          SvgPicture.asset(
            AssetsPath.vader,
            color: AppColors.greenFlourescentColor,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            Strings.vaderIsWatching,
            style: Styles.vaderIsWatchingTextStyle(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            Strings.noInteret,
            style: Styles.noInternetTextStyle(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                color: AppColors.greenFlourescentColor,
                focusElevation: 0.0,
                onPressed: () => retryConnection(),
                child: Text(
                  Strings.retryConnection,
                  style: Styles.textReportStyle(),
                )),
          ),
        ],
      ),
    );
  }
}
