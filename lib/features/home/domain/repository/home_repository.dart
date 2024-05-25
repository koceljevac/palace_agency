import 'package:palace_agency/features/home/domain/entities/real_estate_entity.dart';

import '../../../../core/data_state/data_state.dart';

abstract class HomeRepository{
  Future<DataState<List<RealEstateEntity>>> getRealEstates();
}