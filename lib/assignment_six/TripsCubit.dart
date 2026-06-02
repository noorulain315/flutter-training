import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:flutter_training/assignment_six/TripState.dart';

class TripsCubit extends Cubit<TripState> {
  final TripRepository _repository;

  TripsCubit(this._repository) : super(Initial());

  Future loadTrips() async {
    emit(TripsLoading());

    try {
      final trips = await _repository.fetchTrips();
      emit(TripsLoaded(trips));
    } catch (e) {
      emit(Error('Unable to Load Trips'));
    }
  }

  void addTrips(Trip trip) {
    if (state is TripsLoaded) {
      final currentState = state as TripsLoaded;
      emit(TripsLoaded([trip, ...currentState.trips]));
    }
  }
}
