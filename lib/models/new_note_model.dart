class NewNote {
  int? id;
  String title;
  String content;

  NewNote({this.id, required this.title, required this.content});

  Map<String, dynamic> toJson() => {"title": title, "content": content};

  @override
  String toString() {
    return 'NewNote{id: $id, title: $title, content: $content}';
  }
}
