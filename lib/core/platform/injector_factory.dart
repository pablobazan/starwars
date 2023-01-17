import 'package:get_it/get_it.dart';
import 'package:starwars/core/platform/http_client.dart';
import 'package:starwars/home/data/data_sources/invader_data_source.dart';
import 'package:starwars/home/data/repositories/invader_repository_impl.dart';
import 'package:starwars/home/domain/repositories/invader_repository.dart';

class InjectorFactory {
  static InvaderRepository createInvasorRepository() {
    try {
      return GetIt.I.get<InvaderRepository>();
    } catch (_) {
      final dataSource =
          InvaderDataSourceImpl(client: GetIt.I.get<HttpClient>());
      final repository = InvaderRepositoryImp(invasorDataSource: dataSource);
      GetIt.I.registerSingleton<InvaderRepository>(repository);
      return repository;
    }
  }
}
