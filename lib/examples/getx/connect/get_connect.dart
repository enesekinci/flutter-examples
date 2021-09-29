import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class GetConnectProvider extends GetConnect {
  @override
  void onInit() {
    // super.onInit();
    // All request will pass to jsonEncode so CountryModel.fromJson()

    httpClient.defaultDecoder = CountryModel.fromJson;
    httpClient.baseUrl = 'https://api.com';

    // It's will attach 'apikey' property on header from all requests
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
      return request;
    });

    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    httpClient.addResponseModifier<CountryModel>((request, response) {
      CountryModel model = response.body;
      if (model.countries.contains('Brazil')) {
        model.countries.remove('Brazilll');
      }
    });

    httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  // Get request
  getRequest() async {
    final response = await get('http://yourapi/users/');
    return response;
  }

  // Post request
  postRequest() async {
    var data = {};
    final response = await post('http://yourapi/users', data);
    return response;
  }

  // Post request with File
  postRequestWithFormData(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://yourapi/users/upload', form);
  }

  // Socket WS
  GetSocket getMessages() {
    return socket('https://yourapi/users/socket');
  }
}

class CountryModel {
  var cities = [];
  int? id;
  String? title;

  CountryModel(this.id, this.title);

  CountryModel fromJson(Map data) {
    return CountryModel(data['id'], data['title']);
  }
}
