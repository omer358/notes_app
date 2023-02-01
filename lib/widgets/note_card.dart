import 'package:flutter/material.dart';

import '../helpers.dart';
import '../style/app_style.dart';

Widget noteCard(Function()? onTap, Note doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardColor[doc.color],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc.title,
            style: AppStyle.mainTitle,
          ),
          const SizedBox(height: 4.0),
          Text(
            doc.createdDate,
            style: AppStyle.dateTitle,
          ),
          const SizedBox(height: 8.0),
          Text(
            doc.content,
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
