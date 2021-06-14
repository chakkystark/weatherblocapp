import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherblocapp/posts_cubit.dart';
import 'package:weatherblocapp/posts_views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<PostsCubit>(
        create: (context) => PostsCubit()..getPosts(),
        child: PostsViews(),
      ),
    );
  }
}
