import 'package:get/get.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/data_sources/invasor_data_source.dart';
import 'package:starwars/home/data/repositories/invasor_repository_impl.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class InjectorFactory {
  static InvaderRepository createInvasorRepository() {
    try {
      return Get.find<InvaderRepository>();
    } catch (_) {
      final dataSource = InvasorDataSourceImpl(client: Get.find<HttpClient>());

      return Get.put<InvaderRepository>(
          InvaderRepositoryImp(invasorDataSource: dataSource));
    }
  }
}
