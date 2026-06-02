import 'package:flutter_training/assignment_one/trip_repository.dart';

sealed class TripState {}

class Initial extends TripState {}

class TripsLoading extends TripState {}

class TripsLoaded extends TripState {
  final List<Trip> trips;

  TripsLoaded(this.trips);
}

class Error extends TripState {
  final String message;

  Error(this.message);
}
