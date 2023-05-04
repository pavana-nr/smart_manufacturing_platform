// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://13.234.248.118:9500/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginModel> login(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TraceOrderResponseModel> searchData(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TraceOrderResponseModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'searchAny/aggregate/trace_workorder',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TraceOrderResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorkOrderFullDetailsModel> workOrderFullDetails(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorkOrderFullDetailsModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'searchAny/aggregate/trace_workorder',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorkOrderFullDetailsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LogoutModel> logout(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LogoutModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/logout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LogoutModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
