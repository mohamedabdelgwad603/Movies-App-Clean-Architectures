import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_strings.dart';

import 'package:movies_app/core/utils/media_query_values.dart';
import 'package:movies_app/movies/presentation/components/top_rated_component.dart';

import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';

import '../../../core/sevcies/services_locator.dart';
import '../components/now_playing_component.dart';
import '../components/popular_movies_component.dart';
import '../controller/bloc/movies_event.dart';

class HomeMoviesScreen extends StatelessWidget {
  const HomeMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //nowPlayingComponent
                SizedBox(
                  height: context.heightScreen * .5,
                  child: const NowPlayingMoviesComponent(),
                ),
                SizedBox(height: context.heightScreen / 60),
                _buildTitleAndSeeMoreArrowThatBeforeTheListMovies(context,
                    title: AppStrings.popular),
                SizedBox(
                    height: context.heightScreen * .25,
                    child: const PopularMoviesComponent()),
                SizedBox(height: context.heightScreen / 50),
                _buildTitleAndSeeMoreArrowThatBeforeTheListMovies(context,
                    title: AppStrings.topRatd),
                SizedBox(
                    height: context.heightScreen * .25,
                    child: const TopRatedMoviesComponent()),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }

  _buildTitleAndSeeMoreArrowThatBeforeTheListMovies(BuildContext context,
      {required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            children: [
              Text(
                AppStrings.seeMore,
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 22.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
