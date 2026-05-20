import 'package:flutter/material.dart';

import '../assignment_one/trip_repository.dart';

class TripListViewBuilderScreen extends StatelessWidget {
  final List<Trip> trips;

  const TripListViewBuilderScreen(this.trips, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(trip.description ?? ''),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'From: ${trip.startDate.toLocal().toString().split(' ')[0]}',
                      ),
                      Text(
                        'To: ${trip.endDate.toLocal().toString().split(' ')[0]}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
