import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/assignment_nine/posts_provider.dart';

class RiverpodPostsScreen extends ConsumerWidget {
  const RiverpodPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Posts (Riverpod)'),
      ),
      body: postsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (posts) => ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: posts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
