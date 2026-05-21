import 'package:flutter_training/assigment_two/trip_list_screen.dart';
import 'package:flutter_training/assignment_four_five/trip_details_screen.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TripListScreen()),
    GoRoute(
      path: '/trip-details',
      builder: (context, state) {
        final trip = state.extra as Trip;
        return TripDetailsScreen(trip);
      },
    ),
  ],
);
