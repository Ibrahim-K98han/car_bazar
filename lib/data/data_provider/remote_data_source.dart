import 'package:car_bazar/data/data_provider/network_parser.dart';
import 'package:car_bazar/data/data_provider/remote_url.dart';
import 'package:car_bazar/data/model/auth/login_state_model.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future getWebsiteSetup(Uri uri);

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
}
