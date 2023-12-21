import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/data/remote/data_sources/post_api_service.dart';
import 'package:posts/data/remote/models/post_model.dart';
import 'package:posts/domain/repositories/posts_repositories.dart';

import 'package:dartz/dartz.dart';

import '../../shared/core/remote/failuer.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsApiService _postsApiService;

  PostsRepositoryImpl(this._postsApiService);

  @override
  Future<Either<Failure, List<PostsModel>>> getPosts() async {
    try {
      final res = await _postsApiService.getPosts();

      if (res.response.statusCode == HttpStatus.ok ) {
        var postsData = res.data;


        if (kDebugMode) {
          print(postsData.toString());
        }
        return right(postsData);
      }
    } on DioError catch (e) {
      if(e.response != null){return
           left(
          ServerFailure.fromDiorError(e)
      );}else{
        return left(   ServerFailure.fromDiorError(e));

      }

    }

    throw Exception("");
  }


}
