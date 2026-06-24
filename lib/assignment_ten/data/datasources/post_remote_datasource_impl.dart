import 'package:dio/dio.dart';
import 'package:flutter_training/assignment_ten/data/datasources/post_remote_datasource.dart';
import 'package:flutter_training/assignment_ten/data/models/post_model.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await dio.get('/posts');
    return (response.data as List)
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
