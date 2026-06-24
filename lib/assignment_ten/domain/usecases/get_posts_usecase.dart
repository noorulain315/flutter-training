import 'package:flutter_training/assignment_ten/domain/entities/post_entity.dart';
import 'package:flutter_training/assignment_ten/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<PostEntity>> call() => repository.getPosts();
}
