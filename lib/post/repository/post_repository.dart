import 'package:flutter_lab_7/models/get_posts.dart';
import 'package:flutter_lab_7/rest_client/mobile_api.dart';
import 'package:flutter_lab_7/rest_client/mobile_api_dio.dart';

class PostRepository {
  final _mobileClient = MobileClient(MobileApiDio().client);

  Future<List<Post>> getPosts() async {
    try {
      final getPosts = await _mobileClient.getListData();
      return getPosts.map((e) => Post(
        userId: e.userId,
        id: e.id,
        title: e.title,
        body: e.body,
      )).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      throw Exception('Ошибка загрузки постов: $e');
    }
  }
}