import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assigment_two/trip_list_screen.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:flutter_training/assignment_seven/trips_bloc.dart';
import 'package:flutter_training/assignment_seven/trips_event.dart';
import 'package:flutter_training/assignment_six/TripsCubit.dart';
import 'package:flutter_training/routing/app_router.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TripsBloc(TripRepository())..add(LoadTrips()),
      child: MaterialApp.router(
        title: 'Trips Advisor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
