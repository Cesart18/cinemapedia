import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieSlideShow extends StatelessWidget {
  final List<Movie> movies;
  const MovieSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
              activeSize: 14,
              size: 8,
                activeColor: colors.primary, color: colors.secondary)),
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _SlideImage(imageurl: movie.backdropPath,
          movieId: '${movie.id}',);
        },
      ),
    );
  }
}

class _SlideImage extends StatelessWidget {
  final String imageurl;
  final String movieId;
  const _SlideImage({required this.imageurl, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageurl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12),
                      );
                    }
                    return GestureDetector(
                        onTap: () => context.push('/movie/$movieId'),
                        child: FadeIn(child: child));
                  },
                ))));
  }
}
