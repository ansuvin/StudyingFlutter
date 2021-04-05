// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RetrofitHelper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberDTO _$MemberDTOFromJson(Map<String, dynamic> json) {
  return MemberDTO(
    memberClassNumber: json['memberClassNumber'] as String,
    memberEmail: json['memberEmail'] as String,
    memberPassword: json['memberPassword'] as String,
  );
}

Map<String, dynamic> _$MemberDTOToJson(MemberDTO instance) => <String, dynamic>{
      'memberClassNumber': instance.memberClassNumber,
      'memberEmail': instance.memberEmail,
      'memberPassword': instance.memberPassword,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    code: json['code'] as int,
    msg: json['msg'] as String,
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'success': instance.success,
    };

MemberLoginDTO _$MemberLoginDTOFromJson(Map<String, dynamic> json) {
  return MemberLoginDTO(
    memberEmail: json['memberEmail'] as String,
    memberPassword: json['memberPassword'] as String,
  );
}

Map<String, dynamic> _$MemberLoginDTOToJson(MemberLoginDTO instance) =>
    <String, dynamic>{
      'memberEmail': instance.memberEmail,
      'memberPassword': instance.memberPassword,
    };

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) {
  return ResponseLogin(
    code: json['code'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    msg: json['msg'] as String,
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
      'success': instance.success,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    accessToken: json['accessToken'] as String,
    memberClassNumber: json['memberClassNumber'] as String,
    memberEmail: json['memberEmail'] as String,
    roles: json['roles'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'memberClassNumber': instance.memberClassNumber,
      'memberEmail': instance.memberEmail,
      'roles': instance.roles,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RetrofitHelper implements RetrofitHelper {
  _RetrofitHelper(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.137.47:8080/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Response> postJoin(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/join',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Response.fromJson(_result.data);
    return value;
  }

  @override
  Future<ResponseLogin> postLogin(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseLogin.fromJson(_result.data);
    return value;
  }
}
