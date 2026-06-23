import 'package:dio/dio.dart';
import 'package:flutter_training/assignment_eight/models/post.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<Post>> fetchPosts() async {
    final response = await dio.get('/posts');
    return (response.data as List)
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList()
        ;
  }
}
