import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:smart_manufacturing_platform/constants/constants.dart';
import 'package:smart_manufacturing_platform/models/login_model/login_model.dart';
import 'package:smart_manufacturing_platform/models/logout_model/logout_model.dart';
import 'package:smart_manufacturing_platform/models/trace_order_response/trace_order_response_model.dart';
import 'package:smart_manufacturing_platform/models/workorder_full_details/work_order_full_details_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  factory RestClient.init() {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    return RestClient(dio);
  }

  factory RestClient.initWithToken(String token) {
    debugPrint("token" + token);
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer $token";
    return RestClient(dio);
  }

  @POST("auth/login")
  Future<LoginModel> login(@Body() data);

  // @POST("searchAny/trace_master_data")
  // Future<SearchModel> searchData(@Body() data);

  // @POST("searchAny/trace_workorder")
  // Future<SearchModel> searchData(@Body() data);
  @POST("searchAny/aggregate/trace_workorder")
  Future<TraceOrderResponseModel> searchData(@Body() data);

  @POST("searchAny/aggregate/trace_workorder")
  Future<WorkOrderFullDetailsModel> workOrderFullDetails(@Body() data);

  @POST("auth/logout")
  Future<LogoutModel> logout(@Body() data);

  // @GET("/{path}")
  // Future<SubStainsModel> getAllSubStains(@Path() String path);

  // @GET("/machinewash")
  // Future<MachineWash> getMachineWash();
}
