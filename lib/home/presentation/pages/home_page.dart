import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/presentation/navigation/routes.dart';
import 'package:starwars/core/presentation/styles/colors.dart';
import 'package:starwars/core/widgets/app_bar.dart';
import 'package:starwars/core/widgets/internet_drawer/internet_drawer.dart';
import 'package:starwars/core/widgets/loading_page.dart';
import 'package:starwars/home/domain/entities/invader.dart';
import 'package:starwars/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:starwars/home/presentation/widgets/card_wanted_invader_widget.dart';
import 'package:starwars/home/presentation/widgets/empty_page_widget.dart';
import 'package:starwars/home/presentation/widgets/error_page_widget.dart';
import 'package:starwars/home/presentation/widgets/loading_fade_in_up/bloc/loading_fade_in_up_bloc.dart';
import 'package:starwars/home/presentation/widgets/loading_fade_in_up/loading_fade_in_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  int page = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    BlocProvider.of<HomeBloc>(context).add(HomeBlocGetFirstInvadersEvent());

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        context.read<LoadingFadeInUpBloc>().add(LoadingFadeInUpShowItEvent());
        context.read<HomeBloc>().add(HomeBlocGetInvaderEvent(page: ++page));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const StarWarsAppBar(),
        endDrawer: const InternetDrawer(),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeLoadedState) {
              context
                  .read<LoadingFadeInUpBloc>()
                  .add(LoadingFadeInUpHideItEvent());
            }
          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const LoadingWidget();
            } else if (state is HomeLoadedState) {
              return _Content(
                invaderList: state.invaderList.invaders,
                scrollController: _scrollController,
              );
            } else if (state is HomeFailedState) {
              return ErrorPage(retryConnection: () {});
            } else if (state is HomeEmptyState) {
              return EmptyPage(retryInvaders: () {});
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}

class _Content extends StatelessWidget {
  final List<Invader>? invaderList;
  final ScrollController scrollController;

  const _Content({
    Key? key,
    required this.invaderList,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h),
      child: Stack(
        children: [
          ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: invaderList!.length,
              itemBuilder: (_, index) {
                return CardWantedInvader(
                    invaderList: invaderList!,
                    index: index,
                    nextPage: () => Navigator.pushNamed(
                        context, Routes.invaderDetail,
                        arguments: invaderList![index]));
              }),
          const LoadingFadeInUp(),
        ],
      ),
    );
  }
}
