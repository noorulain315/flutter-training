import 'package:flutter_training/assignment_ten/data/datasources/post_remote_datasource.dart';
import 'package:flutter_training/assignment_ten/domain/entities/post_entity.dart';
import 'package:flutter_training/assignment_ten/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource dataSource;

  PostRepositoryImpl(this.dataSource);

  @override
  Future<List<PostEntity>> getPosts() async {
    final models = await dataSource.fetchPosts();
    return models.map((m) => m.toEntity()).toList();
  }
}
