import 'package:flutter/material.dart';
import 'package:movieapp/description3.dart';
import 'package:movieapp/utils/text.dart';

class TvShows extends StatelessWidget {
  final List populartvshows;

  // const TvShows({super.key, required this.populartvshows});

  const TvShows({Key? key, required this.populartvshows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Mdifidtxt(text: "Tv shows", color: Colors.white, size: 26),
              SizedBox(
                width: 200,
              ),
              Text(
                "Show All",
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: populartvshows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description3(
                                  name: populartvshows[index]['title'] != null
                                      ? populartvshows[index]['title']
                                      : "loading",
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      populartvshows[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      populartvshows[index]['poster_path'],
                                  vote: populartvshows[index]['vote_average'].toString() !=
                                          null
                                      ? populartvshows[index]['vote_average']
                                          .toString()
                                      : "Meri Recommendation hai dekhlo",
                                  launchon: populartvshows[index]['first_air_date']
                                              .toString() !=
                                          null
                                      ? populartvshows[index]['first_air_date']
                                          .toString()
                                      : "loading",
                                  description:
                                      populartvshows[index]['overview'] != null
                                          ? populartvshows[index]['overview']
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
                                            populartvshows[index]
                                                ['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          // Container(
                          //   child: Mdifidtxt(
                          //       text: populartvshows[index]['original_name'] ??
                          //           'Loading',
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
