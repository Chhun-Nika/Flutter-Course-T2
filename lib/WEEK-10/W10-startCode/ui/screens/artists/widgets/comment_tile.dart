import 'package:activity/WEEK-08/spotify/ui/theme/theme.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/utils/date_time_formatter.dart';
import 'package:flutter/material.dart';

import '../../../../model/comments/comment.dart';

class CommentTile extends StatelessWidget {
  final int index;
  final Comment comment;
  const CommentTile({super.key, required this.comment, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("#$index", style: TextStyle(fontSize: 13, color: Colors.grey),),
              Text(DateFormatter.formatDateTime(comment.createdAt), style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Text(comment.comment, style: AppTextStyles.label,)
        ],
      ),
    );
  }
}
