import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assigment_two/trip_list_screen.dart';
import 'package:flutter_training/assignment_four_five/add_trip_screen.dart';
import 'package:flutter_training/assignment_four_five/trip_details_screen.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:flutter_training/assignment_six/TripsCubit.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => TripsCubit(TripRepository())..loadTrips(),
          child: TripListScreen(),
        );
      },
    ),
    GoRoute(
      path: '/trip-details',
      builder: (context, state) {
        final trip = state.extra as Trip;
        return TripDetailsScreen(trip);
      },
    ),
    GoRoute(
      path: '/add-trip',
      builder: (context, state) => const AddTripScreen(),
    ),
  ],
);
