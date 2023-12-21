import 'package:flutter/material.dart';
import 'package:posts/data/remote/models/post_model.dart';
import 'package:posts/presentation/resources/text_style.dart';

class PostItem extends StatelessWidget {
   PostItem ({Key? key ,this.posts}) : super(key: key);




  PostsModel? posts;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(posts!.id.toString()),
      title: Text(
        posts!.title,
        style: TextStyles.textSize15(),
      ),
      subtitle: Text(
        posts!.body,
        style: TextStyles.textSize13(),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      onTap: () {

      },
    );
  }
}
