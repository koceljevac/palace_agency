
import 'package:injectable/injectable.dart';
import 'package:palace_agency/core/data_state/data_state.dart';
import 'package:palace_agency/core/usecases/usecase.dart';
import 'package:palace_agency/features/home/domain/entities/real_estate_entity.dart';
import 'package:palace_agency/features/home/domain/repository/home_repository.dart';

@Injectable()
class GetListRealEstatesUseCase implements UseCase<DataState<List<RealEstateEntity>>, void>{
  final HomeRepository _homeRepository;

  GetListRealEstatesUseCase(@Named('home_remote_repo') this._homeRepository);

  @override
  Future<DataState<List<RealEstateEntity>>> call({void params}) async{
    DataState<List<RealEstateEntity>> state = await _homeRepository.getRealEstates();
    return state;
  }
}