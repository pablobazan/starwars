import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';

class StarWarsAppBar extends StatelessWidget with PreferredSizeWidget {
  const StarWarsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(color: greenFlourescentColor, width: 1)),
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: EdgeInsets.all(4.w),
        child: SvgPicture.asset(
          'assets/icons/deathstar.svg',
          color: greenFlourescentColor,
        ),
      ),
      centerTitle: true,
      title: Text('Star Wars App', style: Styles.titleStyle()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
