import 'package:get_it/get_it.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/core/platform/network_info.dart';

class MainServices {
  Future<void> init() async {
    final connection = NetworkInfoImpl();

    GetIt.instance.registerSingleton<NetworkInfo>(connection);
    GetIt.instance.registerSingleton<HttpClient>(HttpClientImpl(
      connection: connection,
    ));
  }
}
