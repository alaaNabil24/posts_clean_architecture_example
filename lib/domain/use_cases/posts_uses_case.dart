import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/remote/models/post_model.dart';
import '../../shared/core/remote/failuer.dart';
import '../../shared/utils/resources/data_state.dart';
import '../repositories/posts_repositories.dart';


@injectable
class PostsUsesCase {

  final PostsRepository _postsRepository;
  PostsUsesCase(this._postsRepository);


  Future<Either<Failure, List<PostsModel>>>  callPosts() async {


    return await _postsRepository.getPosts();
  }
}