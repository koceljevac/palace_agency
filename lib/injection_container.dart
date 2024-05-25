import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'core/api/api_service.dart';
import 'injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio.options.headers['accept'] = 'application/json';
    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}
