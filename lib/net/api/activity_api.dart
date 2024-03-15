import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_template/net/model/req/id_param.dart';
import 'package:flutter_app_template/net/model/res/activity.dart';
import 'package:retrofit/retrofit.dart';

part 'activity_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class ActivityApi {
  factory ActivityApi(Dio dio, {String baseUrl}) = _ActivityApi;

  @POST('/activity/detail')
  Future<Activity> detail(@Body() IdParam param);
}
