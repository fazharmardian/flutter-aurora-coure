import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print('Request: ${request.method} ${request.url}');
    print('Headers: ${request.headers}');
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('Response Status: ${response.statusCode}');
    print('Response Headers: ${response.headers}');
    if (response is http.Response) {
      print('Response Body: ${response.body}');
    } else {
      print('Unknown response type: ${response.runtimeType}');
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
