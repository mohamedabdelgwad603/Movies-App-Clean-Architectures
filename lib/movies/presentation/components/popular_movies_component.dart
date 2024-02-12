import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/media_query_values.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constances.dart';
import '../../../core/utils/enum.dart';
import '../controller/bloc/movies_state.dart';
import '../shared_widgets/shimmer_widget.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          case RequestState.loaded:
            final popularMovies = state.popularMovies;
            return Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (cotext, index) => FadeInDown(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: double.infinity,
                            width: context.widthScreen * .3,
                            fit: BoxFit.cover,
                            imageUrl: AppConstances.imageUrl(
                                popularMovies[index].backdropPath),
                            placeholder: (context, url) =>
                                const ShimmerWidget(),
                            errorWidget: (context, url, error) {
                              return const Center(child: Icon(Icons.error));
                            },
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: context.widthScreen / 40,
                      ),
                  itemCount: popularMovies.length),
            );

          case RequestState.error:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessageOfPopular),
                backgroundColor: Colors.black,
                duration: const Duration(seconds: 3),
              ),
            );
            return Container();
        }
      },
    );
  }
}
