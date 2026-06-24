import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assigment_two/trip_card_widget.dart';
import 'package:flutter_training/assignment_seven/trips_bloc.dart';
import 'package:flutter_training/assignment_seven/trips_event.dart';
import 'package:flutter_training/assignment_six/TripState.dart';
import 'package:flutter_training/assignment_six/TripsCubit.dart';
import 'package:flutter_training/assignment_three/trip_list_view_builder_screen.dart';
import 'package:flutter_training/assignment_three/trip_sliver_list_builder_screen.dart';
import 'package:go_router/go_router.dart';

import '../assignment_one/trip_repository.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Trips Advisory"),
        actions: [
          IconButton(
            icon: const Icon(Icons.article_outlined),
            tooltip: 'Posts (Bloc)',
            onPressed: () => context.push('/posts'),
          ),
          IconButton(
            icon: const Icon(Icons.dynamic_feed_outlined),
            tooltip: 'Posts (Riverpod)',
            onPressed: () => context.push('/riverpod-posts'),
          ),
          IconButton(
            icon: const Icon(Icons.layers_outlined),
            tooltip: 'Posts (Clean)',
            onPressed: () => context.push('/clean-posts'),
          ),
        ],
      ),
      body: BlocBuilder<TripsBloc, TripState>(
        builder: (context, state) {
          if (state is TripsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TripsLoaded) {
            return TripSliverListBuilderScreen(state.trips, () async {
              context.read<TripsBloc>().add(LoadTrips());
            });
          }
          if (state is Error) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final trip = await context.push<Trip>('/add-trip');
          debugPrint('push returned: $trip');
          if (trip != null && context.mounted) {
            context.read<TripsBloc>().add(AddTrips(trip));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
