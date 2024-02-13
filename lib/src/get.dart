import "dart:convert";

import "package:http/http.dart" as http;

Future<ApiResult> get(
  Uri uri, {
  Map<String, String>? queryParameters,
}) async {
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> apiResponseData = jsonDecode(response.body);
      if (apiResponseData["code"] == 200) {
        final data = apiResponseData["data"];
        if (data is List) {
          return ApiSuccessList(data);
        } else if (data is Map) {
          return ApiSuccessMap(data);
        }
      }
    }
    return ApiError(response.body);
  } catch (e, trace) {
    print("Failed to get editions: $e $trace");
    return ApiError(e);
  }
}

sealed class ApiResult {}

class ApiSuccessList extends ApiResult {
  final List data;

  ApiSuccessList(this.data);
}

class ApiSuccessMap extends ApiResult {
  final Map data;

  ApiSuccessMap(this.data);
}

class ApiError extends ApiResult {
  final Object error;

  ApiError(this.error);
}
