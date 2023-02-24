class Note {
  final int? id;
  final String title;
  final String content;

  const Note(
      {required
      this.title,
      required this.content,
      this.id});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
      };

  @override
  String toString() {
    return "id: $id \n title: $title \n  content: $content \n";
  }
}
