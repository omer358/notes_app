class NewNote {
  String title;
  String content;

  NewNote({required this.title, required this.content});

  Map<String, dynamic> toJson() => {"title": title, "content": content};

  @override
  String toString() {
    return 'NewNote{title: $title, content: $content}';
  }
}
