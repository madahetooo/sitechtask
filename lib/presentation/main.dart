import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sitechtask/presentation/books_widget.dart';
import 'package:sitechtask/presentation/loading_widget.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/loading_widget',
  routes: {
    '/books_widget': (context) => BooksWidget(),
    '/loading_widget': (context) => LoadingWidget(),
  },
));