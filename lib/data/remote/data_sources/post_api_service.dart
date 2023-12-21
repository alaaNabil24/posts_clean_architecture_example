


import 'package:dio/dio.dart';
import 'package:posts/data/remote/models/post_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../shared/constants/api_constans.dart';
part 'post_api_service.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class PostsApiService {
  factory PostsApiService(Dio dio , {String baseUrl}) = _PostsApiService;

  @GET("/posts")
  Future<HttpResponse<List<PostsModel>>> getPosts();
}