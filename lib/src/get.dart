import "dart:convert";

import "package:http/http.dart" as http;

Future<ApiResult> get(Uri uri, {Map<String, String>? queryParameters}) async {
  try {
    final response = await http.get(uri);

    return _parseResponse(response);
  } catch (e, trace) {
    print("Failed to get editions: $e $trace");
    return ApiError(e);
  }
}

Future<ApiResult> _parseResponse(http.Response response) async {
  if (response.statusCode == 200) {
    final Map<String, dynamic> apiResponseData = jsonDecode(response.body);
    if (apiResponseData["code"] == 200) {
      final data = apiResponseData["data"];
      if (data is List) {
        return ApiSuccessList(data);
      } else if (data is Map) {
        return ApiSuccessMap(data as Map<String, dynamic>);
      }
    }
  }
  return ApiError(response.body);
}

sealed class ApiResult {}

class ApiSuccessList extends ApiResult {
  final List data;

  ApiSuccessList(this.data);
}

class ApiSuccessMap extends ApiResult {
  final Map<String, dynamic> data;

  ApiSuccessMap(this.data);
}

class ApiError extends ApiResult {
  final Object error;

  ApiError(this.error);
}
