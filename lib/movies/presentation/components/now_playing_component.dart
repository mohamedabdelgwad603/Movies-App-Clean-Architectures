import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/core/utils/media_query_values.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constances.dart';
import '../../../core/utils/enum.dart';
import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_state.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../shared_widgets/shimmer_widget.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingState != current.nowPlayingState,
        builder: (context, state) {
          switch (state.nowPlayingState) {
            case RequestState.loading:
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            case RequestState.loaded:
              return CarouselSlider(
                  items: state.nowPlayingMovies
                      .map(
                          (movie) => _buildNowPlayingMoviesItem(movie, context))
                      .toList(),
                  options: CarouselOptions(
                      viewportFraction: 1.0, height: double.infinity));

            case RequestState.error:
              return Container(
                alignment: Alignment.center,
                height: context.heightScreen * .3,
                child: Text(state.errorMessageOfNowPlaying),
              );
          }
        });
  }

  GestureDetector _buildNowPlayingMoviesItem(
      Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(id: movie.id)));
      }),
      child: Stack(children: [
        _buildImageWithShaderMask(movie),
        _buildItemTitle(context, movie)
      ]),
    );
  }

  FadeInUp _buildImageWithShaderMask(Movie movie) {
    return FadeInUp(
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
        child: buildCashedNetworkImage(movie),
      ),
    );
  }

  CachedNetworkImage buildCashedNetworkImage(Movie movie) {
    return CachedNetworkImage(
      height: double.infinity,
      fit: BoxFit.cover,
      imageUrl: AppConstances.imageUrl(movie.backdropPath),
      placeholder: (context, url) => const ShimmerWidget(),
      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }

  Padding _buildItemTitle(BuildContext context, Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: AppColors.red,
                size: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppStrings.nowPlaying,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
