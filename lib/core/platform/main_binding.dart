import 'package:get_it/get_it.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/core/platform/network_info.dart';

class MainBinding {
  Future<void> init() async {
    final getIt = GetIt.instance;
    final NetworkInfo connection = NetworkInfoImpl();
    getIt.registerSingleton<HttpClient>(HttpClientImpl(connection: connection));
  }
}
