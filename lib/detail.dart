import 'package:flutter/material.dart';
import 'package:movies_app/models/genre.dart';
import 'package:movies_app/models/movie.dart';

import 'data/movies_api.dart';

class Detail extends StatelessWidget {
  
  // Declare a field that holds the Todo.
  final Movie movie;

  // In the constructor, require a Todo.
  Detail({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: fetchMovie(this.movie.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            Movie movie = snapshot.data as Movie;

            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage("https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                          fit: BoxFit.fill,
                        ),
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: EdgeInsets.all(60.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80.0),
                            Container(
                              width: 90.0,
                              child: new Divider(color: Colors.green),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              movie.title,
                              style: TextStyle(color: Colors.white, fontSize: 40.0),
                            ),
                            Text(
                              movie.dateDateReleasedDate(),
                              style: TextStyle(color: Colors.white, fontSize: 24.0),
                            ),
                            SizedBox(height: 30.0),
                            
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8.0,
                      top: 60.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(40.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Genres",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: movie.genres.length,
                          itemBuilder: (BuildContext context, int index){
                            return Text(
                              movie.genres[index].name,
                              style: TextStyle(fontSize: 14.0),
                            );
                          }
                        ) 
                      ],
                    ),
                  ),
                ), 
              ],
            );
          }else {
              
              return CircularProgressIndicator();
          }
        }
      )
    );
  }
}
