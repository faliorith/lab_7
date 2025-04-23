import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_lab_7/post/bloc/post_bloc.dart';
import 'package:flutter_lab_7/models/get_posts.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PostBloc>(context)..add(GetPostEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Карта мест'),
          backgroundColor: const Color(0xFF4B0082),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingPostState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchedPostState) {
              final List<Post> posts = state.posts;

              final Set<Marker> markers = posts.map((post) {
                return Marker(
                  markerId: MarkerId(post.title), // Используйте уникальное поле
                  position: LatLng(post.userId.toDouble(), post.id.toDouble()), // Пример
                  infoWindow: InfoWindow(title: post.title),
                );
              }).toSet();

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(posts.first.userId.toDouble(), posts.first.id.toDouble()), // Пример
                  zoom: 6,
                ),
                markers: markers,
              );
            } else if (state is FailurePostState) {
              return const Center(child: Text('Ошибка при загрузке мест'));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}