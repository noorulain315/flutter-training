import 'package:flutter_training/assignment_one/trip_repository.dart';

sealed class TripsEvent {}

class LoadTrips extends TripsEvent {}

class AddTrips extends TripsEvent {
  final Trip trip;

  AddTrips(this.trip);
}
