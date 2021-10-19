import 'package:dio/dio.dart';

class DioProvider {
  final Dio _dio = Dio();
  final _baseUrl = 'https://example.com/api';

  DioProvider() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));
  }

  getRequest() async {
    Response<dynamic> response = await _dio.get(_baseUrl + '/test', queryParameters: {'id': 12, 'name': 'wendu'});
    return responseControl(response);
  }

  postRequest() async {
    Response response = await _dio.post(_baseUrl + '/test', data: {'id': 12, 'name': 'wendu'});
    return responseControl(response);
  }

  Future<dynamic> downloadFile() async {
    Response response = await _dio.download('https://www.google.com/', './xx.html');
    return responseControl(response);
  }

  sendFormData() async {
    FormData formData = FormData.fromMap({
      'name': 'wendux',
      'age': 25,
    });
    Response response = await _dio.post(_baseUrl + '/info', data: formData);
    return responseControl(response);
  }

  dynamic responseControl(Response response) {
    if (response.statusCode == 200) {
      return response;
    }
    return false;
  }

  multipleResponseControl(List<Response> response) {
    List<bool> result = [];
    for (var r in response) {
      if (r.statusCode == 200) {
        result.add(true);
      }
      result.add(false);
    }
    return result;
  }

  handlingError() async {
    try {
      await _dio.get('https://enesekinci.github.io/xsddddd');
    } on DioError catch (e) {
      if (e.response != null) {
      } else {}
    }
  }

  multipleConcurrentRequest() async {
    List<Response> response = await Future.wait([_dio.post(_baseUrl + '/info'), _dio.get(_baseUrl + '/token')]);
    return multipleResponseControl(response);
  }
}
