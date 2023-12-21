import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:posts/data/remote/models/post_model.dart';
import 'package:posts/domain/use_cases/posts_uses_case.dart';
import 'package:posts/shared/utils/resources/data_state.dart';

part 'posts_state.dart';

@Injectable()
class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsUsesCase) : super(PostsInitial());

  final PostsUsesCase _postsUsesCase;

  Future<void> posts() async {
    emit(PostsLoadingState());
    var result = await _postsUsesCase.callPosts();
    result.fold((failure) {

      emit(PostsErrorState());
    } , (posts){

      emit(PostsSuccessState(posts));

    });
    // if (result.) {
    //   emit(PostsSuccessState(data.data));
    // }     if (data is DataFailed) {
    //   if (kDebugMode) {
    //     print("${data.errorMessage}");
    //   }
    //   emit(PostsErrorState());
    // }
  }
}
