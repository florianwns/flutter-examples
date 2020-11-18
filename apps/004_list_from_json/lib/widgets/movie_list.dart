import 'dart:math';

import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  final List<MaterialColor> colors = [Colors.deepOrange, Colors.deepPurple, Colors.teal];
  Random random = new Random();

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.all(5),
              child: CustomPaint(
                painter: CircleBackgroundPainter(colors[random.nextInt(colors.length)]),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Center(
                    child: Text(
                      '${movies[index].title[0]}',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            title: Text('${movies[index].title}'),
            subtitle: Text('${movies[index].cast.join(' \u2022 ')}'),
            trailing: Text(
              '${movies[index].year}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircleBackgroundPainter extends CustomPainter {
  final Color color;

  CircleBackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundStyle = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width,
      backgroundStyle,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
