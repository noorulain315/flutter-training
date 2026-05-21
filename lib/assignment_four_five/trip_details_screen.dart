import 'package:flutter/material.dart';

import '../assignment_one/trip_repository.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen(this.trip, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(trip.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(trip.description ?? ''),
            Text('From: ${trip.startDate.toString().split(' ')[0]}'),
            Text('Status: ${trip.status.name}'),
          ],
        ),
      ),
    );
  }
}
