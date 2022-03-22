import 'package:flutter/material.dart';
import 'package:owlmovie/constant/utils.dart';
import 'package:owlmovie/mixins/server.dart';
import 'package:owlmovie/model/movie.dart';

// ignore: must_be_immutable
class MovieView extends StatelessWidget {
  late Movie movie;
  MovieView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              Server.alamatGambar + movie.posterPath,
              width: 80,
              height: 120,
            ),
            const SizedBox(
              width: 3,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: poppinsbold12.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movie.releaseDate,
                    style: poppinsLight.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: poppinsLight.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
