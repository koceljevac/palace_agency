import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:palace_agency/core/widgets/item_real_estate.dart';
import 'package:palace_agency/features/home/presentation/bloc/home_bloc.dart';
import 'package:palace_agency/injection_container.dart';
import '../../../../routes.dart';
import '../widgets/section/search_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt<HomeBloc>()..add(GetRealEstates()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is RealEstateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RealEstateDone) {
              return Column(
                children: [
                  SearchBarSection(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.realEstates!.length,
                      itemBuilder: (context, index) {
                        final realEstate = state.realEstates![index];
                        return ItemRealEstate(
                          onTap: () {
                            context.push(RouteNames.details,extra: realEstate);
                          }, realEstateEntity: realEstate
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is RealEstateError) {
              return Center(child: Text('Greska'));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
