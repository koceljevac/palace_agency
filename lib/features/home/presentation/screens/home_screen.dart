import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palace_agency/core/widgets/item_real_estate.dart';

import '../../../../routes.dart';
import '../widgets/section/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          SearchBarSection(),
          ItemRealEstate(
            onTap: () {
              context.push(RouteNames.details);
            },
          ),
        ],
      ),
    );
  }
}
