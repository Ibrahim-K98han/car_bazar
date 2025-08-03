import 'package:car_bazar/data/data_provider/network_parser.dart';
import 'package:car_bazar/data/data_provider/remote_url.dart';
import 'package:car_bazar/data/model/auth/login_state_model.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future getWebsiteSetup(Uri uri);

  Future getAllCarsList(Uri url);
  Future getSearchAttribute(Uri url);
  Future getHomeData(String langCode);
  Future getCity(Uri url, String id);
  Future contactMessage(String langCode, Map<String, dynamic> body);
  Future contactDealer(String langCode, String id, Map<String, dynamic> body);

  Future getDealerDetails(String langCode, String userName);
  Future getAllDealerList(Uri url);
  Future getCarsDetails(String langCode, String id);
  Future getDealerCity(Uri url);
  Future login(LoginStateModel body);

  Future logout(Uri uri);
}

typedef CallClientMethod = Future<http.Response> Function();

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  final postDeleteHeader = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  @override
  Future login(LoginStateModel body) async {
    final uri = Uri.parse(
      RemoteUrls.login,
    ).replace(queryParameters: {'lang_code': body.languageCode});
    final clientMethod = client.post(
      uri,
      body: body.toMap(),
      headers: postDeleteHeader,
    );
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getWebsiteSetup(Uri uri) async {
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future logout(Uri uri) async {
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getHomeData(String langCode) async {
    final uri = Uri.parse(
      RemoteUrls.homeUrl,
    ).replace(queryParameters: {'lang_code': langCode});
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getAllCarsList(Uri url) async {
    final clientMethod = client.get(url, headers: headers);
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getAllDealerList(Uri url) async {
    final clientMethod = client.get(url, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getCarsDetails(String langCode, String id) async {
    final uri = Uri.parse(RemoteUrls.carDetails(id)).replace(queryParameters: {
      'lang_code': langCode,
    });
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
  @override
  Future getDealerDetails(String langCode, String userName) async {
    final uri = Uri.parse(RemoteUrls.dealerDetails(userName)).replace(queryParameters: {
      'lang_code': langCode,
    });
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
  @override
  Future getSearchAttribute(Uri url) async {
    final clientMethod = client.get(url, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
  @override
  Future getCity(Uri url, String id) async {
    final clientMethod = client.get(url, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
  @override
  Future getDealerCity(Uri url) async {
    final clientMethod = client.get(url, headers: headers);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
  @override
  Future contactMessage(String langCode,  Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.contactMessage).replace(queryParameters: {
      'lang_code': langCode,
    });

    final clientMethod =
    client.post(uri, headers: postDeleteHeader, body: body);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future contactDealer(String langCode, String id, Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.contactDealer(id)).replace(queryParameters: {
      'lang_code': langCode,
    });

    final clientMethod =
    client.post(uri, headers: postDeleteHeader, body: body);
    final responseJsonBody =
    await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  }
