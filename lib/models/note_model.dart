class Note {
   int? id;
  String title;
  String content;
  final String? createdDate;
  String modifiedAt;

  Note(
      {required this.title,
      required this.content,
      this.id,
      this.createdDate,
      required this.modifiedAt});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        title: json['title'],
        content: json['content'],
        createdDate: json['created_date'],
        modifiedAt: json['modified_at'],
      );

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'content': content,
        'created_date': createdDate,
        'modified_at': modifiedAt,
      };

  @override
  String toString() {
    return "ID: $id \n,"
        " Title: $title \n,  "
        "Content: $content \n, "
        "Created At: $createdDate,\n "
        "Last Update: $modifiedAt";
  }
}
