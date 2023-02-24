import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../style/app_style.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteCard(
      {super.key,
      required this.note,
      required this.onTap,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: AppStyle.mainTitle.copyWith(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  note.content,
                  style: AppStyle.mainContent.copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
