import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/domain/use_cases/posts_uses_case.dart';
import 'package:posts/presentation/pages/posts/cubit/posts_cubit.dart';
import 'package:posts/shared/di/di.dart';

import '../../widgets/post_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(getIt())..posts(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              return state is PostsSuccessState
                  ? ListView.separated(
                      itemBuilder: (_, index) => PostItem(
                            posts: state.posts?[index],
                          ),
                      separatorBuilder: (_, index) => const Divider(),
                      itemCount: 3)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
