import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetDataCall {
  static Future<ApiCallResponse> call({
    int page,
  }) {
    final body = '''
{
  "identifier": "Get Task",
"user_id": "lodPvyeM11Tudy0aev4fqsi4oo22",
  "page": ${page}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetData',
      apiUrl:
          'https://qa.digitalasiasolusindo.com/api/method/api_integration.api_integration.request.read_by_firebase',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token 9027f1786d95ede:e4ee54321357056',
      },
      params: {
        'page': page,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetMetaCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "identifier": "Get Task Meta",
  "user_id": "lodPvyeM11Tudy0aev4fqsi4oo22"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Meta',
      apiUrl:
          'https://qa.digitalasiasolusindo.com/api/method/api_integration.api_integration.request.read_by_firebase',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token 9027f1786d95ede:e4ee54321357056',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
