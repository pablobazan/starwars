import 'package:flutter/material.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';

class StarWarsAppBar extends StatelessWidget with PreferredSizeWidget {
  const StarWarsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(color: AppColors.greenFlourescentColor, width: 1)),
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      title: Text('Star Wars App', style: Styles.titleStyle()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
