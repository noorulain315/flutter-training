import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/assigment_two/trip_card_widget.dart';

import '../assignment_one/trip_repository.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
      future: TripRepository().fetchTrips(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return TripCardWidget(snapshot.data!);
      },
    );
  }
}
