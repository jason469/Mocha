import 'dart:convert';

class Note {
  final String id;
  final String title;
  final String description;
  final String userId;
  String? userName;
  final bool isCompleted;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    this.userName,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'userId': userId,
      'userName': userName,
      'isCompleted': isCompleted,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['_id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      isCompleted: map['isCompleted'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
