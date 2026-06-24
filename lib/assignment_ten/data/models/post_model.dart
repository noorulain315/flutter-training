import 'package:flutter_training/assignment_ten/domain/entities/post_entity.dart';

class PostModel {
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );

  PostEntity toEntity() => PostEntity(id: id, title: title, body: body);
}
