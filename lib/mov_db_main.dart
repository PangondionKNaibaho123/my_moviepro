import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_moviepro/widgets/now_play.dart';
import 'package:my_moviepro/widgets/popular.dart';
import 'package:my_moviepro/widgets/top_rated.dart';
import 'package:my_moviepro/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'apps_drawer.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviedbMain()
    );
  }

}

class MoviedbMain extends StatefulWidget{
  MoviedbMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MoviedbMain();
  }
}

class _MoviedbMain extends State<MoviedbMain>{

  List nowplayingmovies = [];
  List topratedmovies = [];
  List popularmovies = [];
  List upcomingmovies = [];

  final String apikey = 'f0e9e0e9f224c4feb567ad64ae5f0d04';
  final apireadacesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMGU5ZTBlOWYyMjRjNGZlYjU2N2FkNjRhZTVmMGQwNCIsInN1YiI6IjYxNTM3YThkZThhM2UxMDA4YWU0NTgyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.75AtCGmeKXpaI3QPAlXwlrbWuahAhpr2fu-M_RkIf3Y';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbCustomLogs = TMDB(ApiKeys(apikey, apireadacesstoken), logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map nowplaymovieresult = await tmdbCustomLogs.v3.movies.getNowPlaying();
    Map topratedmovieresult = await tmdbCustomLogs.v3.movies.getTopRated();
    Map popularmovieresult = await tmdbCustomLogs.v3.movies.getPouplar();
    Map upcomingmovieresult = await tmdbCustomLogs.v3.movies.getUpcoming();

    setState((){
      nowplayingmovies = nowplaymovieresult['results'];
      topratedmovies = topratedmovieresult['results'];
      popularmovies = popularmovieresult['results'];
      upcomingmovies = upcomingmovieresult['results'];
    });

    print(nowplayingmovies);

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Home", style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      drawer: AppsDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NowPlaying(nowplay:nowplayingmovies),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TopRated(toprated: topratedmovies),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Popular(popular: popularmovies),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Upcoming(upcoming: upcomingmovies),
          ),
        ],
      ),
    );
  }

}