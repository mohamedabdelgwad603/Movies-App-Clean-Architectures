import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/core/utils/media_query_values.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';

import '../../../core/sevcies/services_locator.dart';
import '../../domain/entities/genre.dart';
import '../shared_widgets/shimmer_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetRecommendationsEvent(id)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          print(state);
          final movieDetails = state.movieDetails;
          return Scaffold(
            body: movieDetails != null
                ? CustomScrollView(
                    key: const Key('movieDetailsScreen'),
                    slivers: [
                      _buildSliverAppBar(context, movieDetails),
                      SliverToBoxAdapter(
                        child: _buildMovieDetails(context, movieDetails),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
                        sliver: SliverToBoxAdapter(
                          child: Text('more like this'.toUpperCase(),
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              childCount: state.recommendaions.length,
                              (context, index) {
                            final recommendations = state.recommendaions;
                            return FadeInDown(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  height: double.infinity,
                                  width: context.widthScreen * .3,
                                  fit: BoxFit.cover,
                                  imageUrl: recommendations[index]
                                              .backdropPath !=
                                          null
                                      ? AppConstances.imageUrl(
                                          recommendations[index].backdropPath!)
                                      : 'https://cdn-icons-png.flaticon.com/512/2748/2748558.png',
                                  placeholder: (context, url) =>
                                      const ShimmerWidget(),
                                  errorWidget: (context, url, error) {
                                    return const Center(
                                        child: Icon(Icons.error));
                                  },
                                ),
                              ),
                            );
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 0.7,
                            crossAxisCount: 3,
                          ))
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }

  SizedBox _buildMovieDetails(BuildContext context, MovieDetails movieDetails) {
    return SizedBox(
      height: context.heightScreen * .3,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movieDetails.title,
                style: Theme.of(context).textTheme.titleMedium),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      movieDetails.releaseDate.split('-')[0],
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('${movieDetails.voteAverage}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary)),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(_showRunTime(movieDetails.runTime),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[400])),
                ],
              ),
            ),
            Text(
              movieDetails.overview,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[200], fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${AppStrings.genres}: ${_showGenres(movieDetails.genres)}',
              style: TextStyle(color: Colors.grey[500], fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showRunTime(int runTime) {
    final int hours = runTime ~/ 60;
    final int minutes = runTime % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  SliverAppBar _buildSliverAppBar(
      BuildContext context, MovieDetails? movieDetails) {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundColor,
      expandedHeight: context.heightScreen * .3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: movieDetails != null
            ? FadeInUp(
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // fromLTRB
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.3, 0.5, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    height: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: AppConstances.imageUrl(movieDetails.backdropPath),
                    placeholder: (context, url) => const ShimmerWidget(),
                    errorWidget: (context, url, error) {
                      return const Center(child: Icon(Icons.error));
                    },
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
