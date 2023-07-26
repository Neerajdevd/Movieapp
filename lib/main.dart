import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.red),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];

  List topratedmovies = [];

  List populartvshows = [];

  final String apikey = '3d749d289649244a41e848b147d63ccc';

  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDc0OWQyODk2NDkyNDRhNDFlODQ4YjE0N2Q2M2NjYyIsInN1YiI6IjY0OWQ5ZWVmYzA3MmEyMDEyZTIzYjYwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YJKDiQqyW7QJROl574SMTk_uYlKweUHx9S_Cqcx9Y2I';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlogs.v3.tv.getPopular();
    print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      populartvshows = tvresult['results'];
    });
    print(trendingmovies);
    print(populartvshows);
    print(topratedmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   // centerTitle: true,
      //   // title: const Mdifidtxt(
      //   //   text: "Flutter MovieApp",
      //   //   color: Colors.red,
      //   //   size: 30,
      //   // ),
      // ),
      bottomNavigationBar: const GNav(tabs: [
        GButton(
          icon: Icons.home,
          iconSize: 23,
        ),
        GButton(
          icon: Icons.search,
          iconSize: 23,
        ),
        GButton(
          icon: Icons.tv,
          iconSize: 23,
        ),
        GButton(
          icon: Icons.download_sharp,
          iconSize: 23,
        ),
        GButton(
          icon: Icons.list,
          iconSize: 23,
        ),
      ]),
      body: ListView(
        children: [
          // const SizedBox(
          //   height: 30,
          // ),
          TrendingMovies(trending: trendingmovies),
          TvShows(populartvshows: populartvshows),
          TopRatedMovies(topratedmovies: topratedmovies),
        ],
      ),
    );
  }
}
