import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/localization/strings.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/widgets/internet_drawer/bloc/internet_drawer_bloc.dart';

class InternetDrawer extends StatelessWidget {
  const InternetDrawer({Key? key}) : super(key: key);

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
                      color: AppColors.greenFlourescentColor.withOpacity(0.8),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(Strings.connection,
                              textAlign: TextAlign.center),
                          BlocBuilder<InternetDrawerBloc, InternetDrawerState>(
                            builder: (context, state) {
                              return Switch(
                                  activeColor: Colors.black,
                                  value: state.enableInternetConnection,
                                  onChanged: (value) {
                                    context.read<InternetDrawerBloc>().add(
                                        InternetDrawerChangeInternetConnectionEvent(
                                            value: value));
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.black, //,
                  border: Border(
                    bottom: BorderSide(
                        color: AppColors.greenFlourescentColor, width: 0.5),
                    left: BorderSide(
                        color: AppColors.greenFlourescentColor, width: 0.5),
                    top: BorderSide(
                        color: AppColors.greenFlourescentColor, width: 0.5),
                  ))),
        ),
      ),
    );
  }
}
