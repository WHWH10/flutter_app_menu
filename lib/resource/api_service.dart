import 'package:flutter_app_menu/utils/constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://openapi.naver.com/v1/search/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    // dio.interceptors.add(PrettyDioLogger());
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    return ApiService(dio);
  }

  // 이미지 검색
  @GET("image")
  @Headers(<String, dynamic>{
    "X-Naver-Client-Id": headerNaver,
    "X-Naver-Client-Secret": secretNaver
  })
  @FormUrlEncoded()
  Future getImageResult(@Query('query') String query);

  //블로그 검색
  @GET("blog.json")
  @Headers(<String, dynamic>{
    "X-Naver-Client-Id": headerNaver,
    "X-Naver-Client-Secret": secretNaver
  })
  @FormUrlEncoded()
  Future getBlogResult(@Query('query') String query);

  //백과사전 검색
  @GET("encyc.json")
  @Headers(<String, dynamic>{
    "X-Naver-Client-Id": headerNaver,
    "X-Naver-Client-Secret": secretNaver
  })
  @FormUrlEncoded()
  Future getDictResult(@Query('query') String query);
}
