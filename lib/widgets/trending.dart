import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  // const TrendingMovies({super.key, required this.trending});

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Mdifidtxt(
          //     text: "Trending Movies",
          //     color: Color.fromARGB(255, 250, 248, 248),
          //     size: 26),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : "loading",
                                  decription:
                                      trending[index]['overview'] != null
                                          ? trending[index]['overview']
                                          : "loading",
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  vote: trending[index]['vote_average']
                                              .toString() !=
                                          null
                                      ? trending[index]['vote_average']
                                          .toString()
                                      : "loading",
                                  launch_on: trending[index]
                                      ['first_air_date'])));
                    },
                    child: Container(
                      height: 200,
                      width: 390,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: 200,
                              width: 390,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),

                          Positioned(
                              bottom: 10,
                              child: Row(children: [
                                // trending[index]['title'],
                                Container(
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color.fromARGB(
                                        255, 248, 118, 111),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Watch Now",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )
                              ])),

                          // Container(
                          //   child: Mdifidtxt(
                          //       text: trending[index]['title'] != null
                          //           ? trending[index]['title']
                          //           : 'Loading',
                          //       color: Colors.white,
                          //       size: 10),
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
