import 'package:dartz/dartz.dart';
import 'package:posts/data/remote/models/post_model.dart';

import '../../shared/core/remote/failuer.dart';
import '../../shared/utils/resources/data_state.dart';

abstract class  PostsRepository{




  Future<Either<Failure, List<PostsModel>>>  getPosts();





}