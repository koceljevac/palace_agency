import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palace_agency/features/details/presentation/screens/details_screen.dart';
import 'package:palace_agency/features/details/presentation/screens/gallery_screen.dart';
import 'package:palace_agency/features/home/domain/entities/real_estate_entity.dart';
import 'features/discovery/presentation/screens/discovery_screen.dart';
import 'features/history/presentation/screens/history_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/main/presentation/screens/main_page.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/saved/presentation/screens/saved_screen.dart';

class RouteNames {
  static const String main = '/';
  static const String home = '/home';
  static const String discovery = '/discovery';
  static const String saved = '/saved';
  static const String history = '/history';
  static const String profile = '/profile';
  static const String details = '/details';
  static const String gallery = '/gallery';
}

final GoRouter router = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child);
      },
      routes: [
        GoRoute(
          path: RouteNames.home,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: HomeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RouteNames.discovery,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const DiscoveryScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RouteNames.saved,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SavedScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RouteNames.history,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const HistoryScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RouteNames.profile,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: RouteNames.details,
      builder: (context, state) {
        final realEstate = state.extra as RealEstateEntity;
        return  DetailsScreen(realEstateEntity: realEstate);
      },
    ),
    GoRoute(
      path: RouteNames.gallery,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child:  GalleryScreen(),
        );
      },
    ),
  ],
);
