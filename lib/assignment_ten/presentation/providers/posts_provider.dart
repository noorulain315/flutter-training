import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/assignment_ten/di/injection.dart';
import 'package:flutter_training/assignment_ten/domain/entities/post_entity.dart';

final postsProvider = FutureProvider<List<PostEntity>>((ref) {
  return ref.read(getPostsUseCaseProvider).call();
});
