import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/assignment_eight/datasource/post_remote_data_source.dart';
import 'package:flutter_training/assignment_eight/models/post.dart';
import 'package:flutter_training/assignment_eight/network/api_client.dart';

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>(
  (ref) => PostRemoteDataSource(ApiClient().dio),
);

final postsProvider = FutureProvider<List<Post>>((ref) {
  return ref.watch(postRemoteDataSourceProvider).fetchPosts();
});
