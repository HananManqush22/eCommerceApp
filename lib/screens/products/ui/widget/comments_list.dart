import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => UserComments(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 5,
    );
  }
}

class UserComments extends StatelessWidget {
  const UserComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [Text('comment')]),
        Row(
          children: [
            Text('Replay', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [Text('Replay.....')]),
      ],
    );
  }
}
