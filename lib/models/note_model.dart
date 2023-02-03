class Note {
  final int? id;
  final String title;
  final String content;
  final int color;

  const Note(
      {required this.title,
      required this.content,
      required this.color,
      this.id});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        color: json['color']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'color': color
      };

  @override
  String toString() {
    return "id: $id \n title: $title \n  content: $content \n";
  }
}
