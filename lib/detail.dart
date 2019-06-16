import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

class Detail extends StatelessWidget {
  
  // Declare a field that holds the Todo.
  final Movie movie;

  // In the constructor, require a Todo.
  Detail({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.title}"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}