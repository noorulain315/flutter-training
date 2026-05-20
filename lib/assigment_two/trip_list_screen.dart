import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/assigment_two/trip_card_widget.dart';
import 'package:flutter_training/assignment_three/trip_list_view_builder_screen.dart';
import 'package:flutter_training/assignment_three/trip_sliver_list_builder_screen.dart';

import '../assignment_one/trip_repository.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Trips Advisory"),
      ),
      body: FutureBuilder(
        future: TripRepository().fetchTrips(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return TripSliverListBuilderScreen(snapshot.data!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Button Clicked! ')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
