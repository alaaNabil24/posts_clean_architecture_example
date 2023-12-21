import 'package:injectable/injectable.dart';
import 'package:posts/data/remote/data_sources/post_api_service.dart';
import 'package:dio/dio.dart';

import '../core/remote/logger.dart';


@module
abstract class AppModule {


  @preResolve
  Future<Dio> get dio async => await Dio();


  PostsApiService getService(Dio dio) {

    dio.interceptors.add(LoggerApi());

    dio.options.connectTimeout = const Duration(milliseconds: Duration.millisecondsPerMinute);
    dio.options.receiveTimeout = const Duration(milliseconds: Duration.millisecondsPerMinute);
    dio.options.validateStatus = (status) {
      return status! <= 500;
    };
    return PostsApiService(dio);
  }


}