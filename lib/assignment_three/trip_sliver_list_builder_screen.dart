import 'package:flutter/material.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';

class TripSliverListBuilderScreen extends StatelessWidget {
  final List<Trip> trips;

  const TripSliverListBuilderScreen(this.trips, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(
              'All Trips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage('https://picsum.photos/800/400'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final trip = trips[index];
              return SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTripTitle(trip),
                              Text(trip.description ?? ''),
                            ],
                          ),
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
            }, childCount: trips.length),
          ),
        ],
      ),
    );
  }

  Widget buildTripTitle(Trip trip) {
    return Row(
      children: [
        Text(
          trip.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            trip.status.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: getStatusColor(trip.status),
            ),
          ),
        ),
      ],
    );
  }

  Color getStatusColor(TripStatus tripStatus) {
    return switch (tripStatus) {
      TripStatus.planning => Colors.blue,
      TripStatus.active => Colors.amber,
      TripStatus.completed => Colors.grey,
    };
  }
}
