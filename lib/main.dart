import 'package:flutter/material.dart';
import 'package:movies_app/movie.dart';
import 'movies_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<Movie> _data = new List<Movie>();

  @override
  void initState(){
    setState((){

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: FutureBuilder(
        future: fetchMovie(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {

              List<Movie> movie = snapshot.data as List<Movie>;

              return new ListView.builder(
                itemCount: movie.length,
                itemBuilder: (BuildContext context, int index){

                  return new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie[index].posterPath}',
                            height: 40.0,
                            width: 20.0
                          ),
                          title: Text('${movie[index].title}'),
                          subtitle: Text('${movie[index].dateDateReleasedDate()}'),
                        ),
                        
                      //  new Text('${movie[index].title}'),
                      //  new Text('${movie[index].releasedDate}'),
                      ],
                    ),
                    
                  );
                },
              );

            } else {
              return CircularProgressIndicator();
            }
          }),
      ),
    );
  }
}