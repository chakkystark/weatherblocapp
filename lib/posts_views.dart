import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherblocapp/post.dart';
import 'package:weatherblocapp/posts_cubit.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class PostsViews extends StatelessWidget {
  const PostsViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
              color: Colors.pink,
            ));
          }
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ExpansionTile(
                      title: Text(posts[index].title.toUpperCase()),
                      children: <Widget>[
                        Linkify(
                          onOpen: (link) => print("Clicked ${link.url}!"),
                          text: posts[index].url,
                        ),
                        ListTile(
                          title: Image.network(
                            '${posts[index].thumbnailUrl}',
                            fit: BoxFit.contain,
                          ),
                        ),
                        ListTile(title: Text(posts[index].albumId.toString())),
                      ]),
                );
              });
        },
      ),
    );
  }
}
