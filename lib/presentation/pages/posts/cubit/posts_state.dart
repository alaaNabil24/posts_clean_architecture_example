part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class PostsErrorState extends PostsState {

}

class PostsSuccessState extends PostsState {



  List<PostsModel> ?posts;

  PostsSuccessState(this.posts);
}

class PostsLoadingState extends PostsState {}

