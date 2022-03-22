import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owlmovie/constant/utils.dart';
import 'package:owlmovie/model/movie.dart';
import 'package:owlmovie/repository/movie_repository.dart';
import 'package:owlmovie/screens/profil_screen.dart';
import 'package:owlmovie/widgets/loading_view.dart';
import 'package:owlmovie/widgets/movie_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> listMovie = [];
  bool isNoLoadMore = false;
  int page = 1;
  bool isLoading = true;

  void callAPI() {
    isLoading = true;
    MovieRepository().getMovie(page).then((List<Movie> value) {
      isLoading = false;
      if (value.isEmpty) {
        isNoLoadMore = true;
      }
      listMovie = [...listMovie, ...value];
      setState(() {});
    }).catchError((err, track) {
      // ignore: avoid_print
      print("Something wrong $err $track");
    });
  }

  @override
  void initState() {
    callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title:
            Text("OwlMovie", style: poppinsbold.copyWith(color: Colors.black)),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuProfil()));
                    },
                    icon: Icon(Icons.person))),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: listMovie.isEmpty
            ? const LoadingView()
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                    if (isNoLoadMore == false) {
                      if (isLoading == false) {
                        page = page + 1;
                        callAPI();
                      }
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                    itemCount: isNoLoadMore == true
                        ? listMovie.length
                        : listMovie.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < listMovie.length) {
                        return MovieView(movie: listMovie[index]);
                      } else {
                        return const LoadingView();
                      }
                    }),
              ),
      ),
    );
  }
}
