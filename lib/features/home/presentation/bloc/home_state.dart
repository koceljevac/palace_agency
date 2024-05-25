part of 'home_bloc.dart';

abstract class HomeState extends Equatable{
  final List<RealEstateEntity>? realEstates;
  final DioException ? error;

  const HomeState({this.realEstates, this.error});

  @override
  List<Object?> get props => [realEstates, error];
}


final class RealEstateLoading extends HomeState{
  const RealEstateLoading();
}
final class RealEstateDone extends HomeState{
  const RealEstateDone(List<RealEstateEntity> realEstates): super(realEstates: realEstates);
}

final class RealEstateError extends HomeState{
  const RealEstateError(DioException error): super(error: error);
}