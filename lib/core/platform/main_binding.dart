import 'package:get/get.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/core/platform/network_info.dart';

class MainBinding {
  Future<void> init() async {
    final NetworkInfo connection = NetworkInfoImpl();

    Get.lazyPut<HttpClient>(() => HttpClientImpl(connection: connection));
  }
}
