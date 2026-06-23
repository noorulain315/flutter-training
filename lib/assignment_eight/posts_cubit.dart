import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assignment_eight/datasource/post_remote_data_source.dart';
import 'package:flutter_training/assignment_eight/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRemoteDataSource dataSource;

  PostsCubit(this.dataSource) : super(PostsLoading());

  Future<void> loadPosts() async {
    emit(PostsLoading());
    try {
      final posts = await dataSource.fetchPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
