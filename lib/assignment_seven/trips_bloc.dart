import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:flutter_training/assignment_seven/trips_event.dart';
import 'package:flutter_training/assignment_six/TripState.dart';

class TripsBloc extends Bloc<TripsEvent, TripState> {
  final TripRepository _repository;

  TripsBloc(this._repository) : super(Initial()) {
    on<LoadTrips>(_onLoadTrips);
    on<AddTrips>(_onAddTrip);
  }

  Future<void> _onLoadTrips(LoadTrips event, Emitter<TripState> emit) async {
    emit(TripsLoading());
    try {
      final trips = await _repository.fetchTrips();
      emit(TripsLoaded(trips));
    } catch (e) {
      emit(Error('Unable to Load Trips'));
    }
  }

  void _onAddTrip(AddTrips event, Emitter<TripState> emit) {
    if (state is TripsLoaded) {
      final currentState = state as TripsLoaded;
      emit(TripsLoaded([event.trip, ...currentState.trips]));
    }
  }
}
