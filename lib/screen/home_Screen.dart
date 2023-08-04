import 'package:api_film/api/api.dart';
import 'package:api_film/widget/trandingSlider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/movie.dart';
import '../widget/movieSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> tredingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;

@override
void initState(){
  super.initState();
  tredingMovies = Api().getTradingMovies();
  topRatedMovies = Api().getTopratedMovies();
  upComingMovies = Api().getUpcomingMovies();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/flutflix.png',
            fit: BoxFit.cover,
            height: 40,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text('Treding Movies',
                    style: GoogleFonts.aBeeZee(fontSize: 25)),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: tredingMovies,
                    builder: (context, snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),);
                      }else if(snapshot.hasData){
                        final data = snapshot.data;
                        return TrendingSlider(snapshot: snapshot,);
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Top rated movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),);
                      }else if(snapshot.hasData){
                        final data = snapshot.data;
                        return MoviesSlider(snapshot: snapshot,);
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Upcoming movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: upComingMovies,
                    builder: (context, snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),);
                      }else if(snapshot.hasData){
                        final data = snapshot.data;
                        return MoviesSlider(snapshot: snapshot,);
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ),
                
              ]),
            )));
  }
}
