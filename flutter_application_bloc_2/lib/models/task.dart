import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  String title;
  String description;
  String date;
  String id;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task(
      {required this.title,
      required this.description,
      required this.date,
      required this.id,
      this.isDeleted,
      this.isDone,
      this.isFavorite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith(
      {String? title,
      String? description,
      String? id,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
        title: title ?? this.title,
        date: date ?? this.date,
        description: title ?? this.description,
        isDeleted: isDeleted ?? this.isDeleted,
        isDone: isDone ?? this.isDone,
        id: id ?? this.id,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "id": id,
      "date": date,
      "isDone": isDone,
      "isDeleted": isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      date: map["date"] ?? "",
      isDone: map["isDone"],
      isDeleted: map["isDeleted"],
      isFavorite: map["isFavorite"],
      id: map["id"] ?? "",
    );
  }

  @override
  List<Object?> get props =>
      [title, description, id, date, isDeleted, isDone, isFavorite];
}
