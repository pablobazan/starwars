import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/presentation/styles/styles.dart';
import 'package:starwars/core/utils/assets_path.dart';
import 'package:starwars/core/widgets/app_bar.dart';
import 'package:starwars/core/widgets/internet_drawer/bloc/internet_drawer_bloc.dart';
import 'package:starwars/core/widgets/internet_drawer/internet_drawer.dart';
import 'package:starwars/home/data/models/invader_model.dart';
import 'package:starwars/home/presentation/bloc/invader_details_bloc/invader_details_bloc.dart';

class InvaderDetailsPage extends StatelessWidget {
  const InvaderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invader = ModalRoute.of(context)!.settings.arguments as InvaderModel;
    // context.read<InvaderDetailsBloc>().add(InvaderDetailsEvent.invader(invader));

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const StarWarsAppBar(),
        endDrawer: const InternetDrawer(),
        body: Padding(
          padding:
              EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h, bottom: 4.h),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Hero(
                  tag: invader.created,
                  child: SvgPicture.asset(
                    AssetsPath.wanted,
                    color: AppColors.greenFlourescentColor,
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  invader.name,
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
                                '${Strings.height} ${invader.height} cm',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.weight} ${invader.mass} kg',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.sex} ${invader.gender}',
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
                                '${Strings.hairColor} ${invader.hairColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.skinColor} ${invader.skinColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${Strings.eyeColor} ${invader.eyeColor}',
                                style: Styles.cardTitleStyle(),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const Spacer(),
                BlocListener<InvaderDetailsBloc, InvaderDetailsState>(
                  listener: (context, state) {
                    if (state is InvaderDetailsReportSentState) {
                      _reportSent(context);
                    }
                  },
                  child: BlocBuilder<InternetDrawerBloc, InternetDrawerState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 2.h),
                            color: state.enableInternetConnection
                                ? AppColors.greenFlourescentColor
                                : Colors.grey,
                            focusElevation: 0.0,
                            onPressed: state.enableInternetConnection
                                ? () => context.read<InvaderDetailsBloc>().add(
                                    InvaderDetailsSendReportEvent(
                                        userid: 192,
                                        characterName: invader.name,
                                        dateTime: DateTime.now()))
                                : () => _showNoInternetConnection(context),
                            child: Text(
                              Strings.report,
                              style: Styles.textReportStyle(),
                            )),
                      );
                    },
                  ),
                ),
              ],
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
        ));
  }

  void _showNoInternetConnection(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.noInternetConnection,
                style: TextStyle(color: Colors.black, fontSize: 13.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                Strings.pleaseActivateTheConnection,
                style: TextStyle(color: Colors.black, fontSize: 11.sp),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.greenFlourescentColor,
          duration: const Duration(milliseconds: 1500),
          margin: EdgeInsets.only(bottom: 80.h, right: 20, left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 2),
          )),
    );
  }

  void _reportSent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.invaderReported,
                style: TextStyle(color: Colors.black, fontSize: 13.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                Strings.rebelionShip,
                style: TextStyle(color: Colors.black, fontSize: 11.sp),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.greenFlourescentColor,
          duration: const Duration(milliseconds: 1500),
          margin: EdgeInsets.only(bottom: 80.h, right: 20, left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 2),
          )),
    );
  }
}
