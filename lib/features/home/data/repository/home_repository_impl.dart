import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:palace_agency/core/api/api_service.dart';
import 'package:palace_agency/core/data_state/data_state.dart';
import 'package:palace_agency/features/home/domain/entities/real_estate_entity.dart';
import 'package:palace_agency/features/home/domain/repository/home_repository.dart';

@Named('home_remote_repo')
@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<RealEstateEntity>>> getRealEstates() async {
    try {
      final response = await _apiService.getRealEstate();
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
          requestOptions: RequestOptions(path: ''),
          response: response.response,
        ));
      }
    } catch (e) {
      return DataFailed(e as DioException);
    }
  }
}
