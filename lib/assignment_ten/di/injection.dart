import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/assignment_ten/data/datasources/post_remote_datasource.dart';
import 'package:flutter_training/assignment_ten/data/datasources/post_remote_datasource_impl.dart';
import 'package:flutter_training/assignment_ten/data/repositories/post_repository_impl.dart';
import 'package:flutter_training/assignment_ten/domain/repositories/post_repository.dart';
import 'package:flutter_training/assignment_ten/domain/usecases/get_posts_usecase.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
});

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  return PostRemoteDataSourceImpl(ref.watch(dioProvider));
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepositoryImpl(ref.watch(postRemoteDataSourceProvider));
});

final getPostsUseCaseProvider = Provider<GetPostsUseCase>((ref) {
  return GetPostsUseCase(ref.watch(postRepositoryProvider));
});
