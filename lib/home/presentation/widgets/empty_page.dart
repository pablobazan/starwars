import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SvgPicture.asset(
            'assets/icons/vader.svg',
            color: greenFlourescentColor,
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
        ],
      ),
    );
  }
}
