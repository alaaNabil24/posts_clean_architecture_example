import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posts/presentation/pages/posts/posts_page.dart';
import 'package:posts/shared/helper/navgtion_app.dart';

import '../../resources/text_style.dart';

class MainPage extends StatelessWidget {
   MainPage({Key? key}) : super(key: key);

  var nav =   GetIt.instance.get<NavigationApp>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: TextButton(onPressed: (){

          nav.navigateTo(context, PostsPage());

        } , child: Text("GO TO POSTS " ,style: TextStyles.textSize15(),),),)
    ));
  }
}
