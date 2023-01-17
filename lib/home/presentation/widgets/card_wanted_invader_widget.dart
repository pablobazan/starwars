import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/utils/assets_path.dart';
import 'package:starwars/home/domain/entities/invader.dart';

class CardWantedInvader extends StatelessWidget {
  const CardWantedInvader({
    Key? key,
    required this.invaderList,
    required this.index,
    required this.nextPage,
  }) : super(key: key);

  final List<Invader> invaderList;
  final int index;
  final Function nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => nextPage(),
      child: Container(
        height: 16.h,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  Hero(
                    tag: invaderList[index].created,
                    child: SizedBox(
                      width: 15.w,
                      height: 8.h,
                      child: SvgPicture.asset(
                        AssetsPath.wanted,
                        color: AppColors.greenFlourescentColor,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Strings.name} ${invaderList[index].name}',
                          style: Styles.cardTagStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          '${Strings.height} ${invaderList[index].height} cm',
                          style: Styles.cardTagStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.greenFlourescentColor,
                    height: 7.h,
                    width: 1,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Strings.weight} ${invaderList[index].mass} kg',
                          style: Styles.cardTagStyle(),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          '${Strings.sex} ${invaderList[index].gender}',
                          style: Styles.cardTagStyle(),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: AppColors.greenFlourescentColor.withOpacity(0.1),
            border: const Border(
              bottom: BorderSide(
                  color: AppColors.greenFlourescentColor, width: 0.5),
              left: BorderSide(
                  color: AppColors.greenFlourescentColor, width: 0.5),
              right: BorderSide(
                  color: AppColors.greenFlourescentColor, width: 0.5),
              top: BorderSide(
                  color: AppColors.greenFlourescentColor, width: 0.5),
            )),
      ),
    );
  }
}
