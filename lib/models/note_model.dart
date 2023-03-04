class Note {
   int? id;
   String title;
   String content;
   final String? createdDate;
   String updatedAt;

   Note(
      {required
      this.title,
      required this.content,
      this.id,
      this.createdDate,
      required this.updatedAt});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createdDate: json['created_date'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'created_date': createdDate,
        'updated_at': updatedAt,
      };

  @override
  String toString() {
    return "ID: $id \n,"
        " Title: $title \n,  "
        "Content: $content \n, "
        "Created At: $createdDate,\n "
        "Last Update: $updatedAt";
  }
}
