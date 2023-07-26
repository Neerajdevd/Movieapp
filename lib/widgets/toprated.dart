import 'package:flutter/material.dart';
import 'package:movieapp/decription1.dart';
import 'package:movieapp/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topratedmovies;

  // const TopRatedMovies({super.key, required this.topratedmovies});

  const TopRatedMovies({Key? key, required this.topratedmovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Mdifidtxt(
                text: "Top rated",
                color: Color.fromARGB(255, 253, 251, 251),
                size: 26,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 170,
              ),
              Text(
                "Show All",
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topratedmovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description1(
                                  name: topratedmovies[index]['title'] != null
                                      ? topratedmovies[index]['title']
                                      : "loading",
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      topratedmovies[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      topratedmovies[index]['poster_path'],
                                  vote: topratedmovies[index]['vote_average']
                                      .toString(),
                                  launchon: topratedmovies[index]
                                          ['first_air_date']
                                      .toString(),
                                  description:
                                      topratedmovies[index]['overview'] != null
                                          ? topratedmovies[index]['overview']
                                          : "loading")));
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topratedmovies[index]
                                                ['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          // Container(
                          //   child: Mdifidtxt(
                          //       text: topratedmovies[index]['title'] != null
                          //           ? topratedmovies[index]['title']
                          //           : 'Loading',
                          //       color: Colors.white,
                          //       size: 15),
                          // ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
