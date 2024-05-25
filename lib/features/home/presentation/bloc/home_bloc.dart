import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:palace_agency/core/data_state/data_state.dart';
import 'package:palace_agency/features/home/domain/usecases/get_list_real_estates_use_case.dart';

import '../../domain/entities/real_estate_entity.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListRealEstatesUseCase _getListRealEstatesUseCase;

  HomeBloc(this._getListRealEstatesUseCase) : super(const RealEstateLoading()) {
    on<GetRealEstates>(_onGetRealEstates);
  }

  Future<void> _onGetRealEstates(
      GetRealEstates event, Emitter<HomeState> emit) async {
    final dataState = await _getListRealEstatesUseCase();
    if (dataState is DataSuccess) {
      emit(RealEstateDone(dataState.data!));
    } else {
      emit(RealEstateError(dataState.error!));
    }
  }
}
