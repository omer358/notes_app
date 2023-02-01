class Note {
  final String title;
  final String content;
  final String createdDate;
  final String modifiedAt;
  final int color;

  const Note({
    required this.title,
    required this.content,
    required this.createdDate,
    required this.modifiedAt,
    required this.color
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      createdDate: json['created_date'],
      modifiedAt: json['modified_at'],
      color: json['color_id'],
    );
  }
}
