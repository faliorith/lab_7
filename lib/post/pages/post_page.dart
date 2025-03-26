import 'package:flutter/material.dart';
import 'package:flutter_lab_7/post/bloc/post_bloc.dart';
import 'package:flutter_lab_7/post/bloc/post_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage ({super.key});
  
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
 List<Post> posts = [];
 late PostBloc postBloc;

@override
void initState(){
  super.initState();
  postBloc = PostBloc();
} 

@override
Widget build(BuildContext context){
  return Container();
}
}