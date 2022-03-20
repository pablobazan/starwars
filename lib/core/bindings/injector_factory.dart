import 'package:get/get.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/data_sources/invader_data_source.dart';
import 'package:starwars/home/data/repositories/invader_repository_impl.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class InjectorFactory {
  static InvaderRepository createInvasorRepository() {
    try {
      return Get.find<InvaderRepository>();
    } catch (_) {
      final dataSource = InvaderDataSourceImpl(client: Get.find<HttpClient>());

      return Get.put<InvaderRepository>(
          InvaderRepositoryImp(invasorDataSource: dataSource));
    }
  }
}
