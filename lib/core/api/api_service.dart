import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/home/data/models/real_estate_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://52.59.197.100:8001')
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/api/RealEstates')
  Future<HttpResponse<List<RealEstateModel>>> getRealEstate();
}