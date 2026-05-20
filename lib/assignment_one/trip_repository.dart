class TripRepository {
  Future fetchTrips() async {
    await Future.delayed(Duration(seconds: 1));
    List<Trip> trips = [
      Trip(
        1,
        "Office Trip",
        DateTime(2026, 1, 1),
        DateTime(2026, 1, 5),
        "Annual office outing",
        TripStatus.completed,
      ),
      Trip(
        2,
        "Beach Vacation",
        DateTime(2026, 2, 10),
        DateTime(2026, 2, 15),
        "Relaxing beach holiday",
        TripStatus.completed,
      ),
      Trip(
        3,
        "Mountain Hike",
        DateTime(2026, 3, 5),
        DateTime(2026, 3, 8),
        "Trekking in the mountains",
        TripStatus.completed,
      ),
      Trip(
        4,
        "City Tour",
        DateTime(2026, 3, 20),
        DateTime(2026, 3, 22),
        "Exploring the old city",
        TripStatus.completed,
      ),
      Trip(
        5,
        "Family Reunion",
        DateTime(2026, 4, 1),
        DateTime(2026, 4, 4),
        "Annual family gathering",
        TripStatus.completed,
      ),
      Trip(
        6,
        "Business Conference",
        DateTime(2026, 4, 15),
        DateTime(2026, 4, 17),
        "Tech conference in Dubai",
        TripStatus.completed,
      ),
      Trip(
        7,
        "Road Trip",
        DateTime(2026, 5, 1),
        DateTime(2026, 5, 7),
        "Cross country road trip",
        TripStatus.completed,
      ),
      Trip(
        8,
        "Safari Adventure",
        DateTime(2026, 5, 15),
        DateTime(2026, 5, 25),
        "Wildlife safari in Kenya",
        TripStatus.active,
      ),
      Trip(
        9,
        "Cultural Tour",
        DateTime(2026, 6, 25),
        DateTime(2026, 6, 30),
        "Exploring local heritage",
        TripStatus.planning,
      ),
      Trip(
        10,
        "Island Getaway",
        DateTime(2026, 7, 5),
        DateTime(2026, 7, 12),
        "Tropical island escape",
        TripStatus.planning,
      ),
      Trip(
        11,
        "Ski Trip",
        DateTime(2026, 7, 20),
        DateTime(2026, 7, 25),
        "Skiing in the Alps",
        TripStatus.planning,
      ),
      Trip(
        12,
        "Camping Trip",
        DateTime(2026, 8, 1),
        DateTime(2026, 8, 5),
        "Weekend camping in the woods",
        TripStatus.planning,
      ),
      Trip(
        13,
        "Museum Tour",
        DateTime(2026, 8, 15),
        DateTime(2026, 8, 16),
        "Art and history museums",
        TripStatus.planning,
      ),
      Trip(
        14,
        "Food Tour",
        DateTime(2026, 8, 25),
        DateTime(2026, 8, 27),
        "Local cuisine exploration",
        TripStatus.planning,
      ),
      Trip(
        15,
        "Photography Trip",
        DateTime(2026, 9, 5),
        DateTime(2026, 9, 10),
        "Landscape photography tour",
        TripStatus.planning,
      ),
      Trip(
        16,
        "Wellness Retreat",
        DateTime(2026, 9, 20),
        DateTime(2026, 9, 25),
        "Yoga and meditation retreat",
        TripStatus.planning,
      ),
      Trip(
        17,
        "Adventure Sports",
        DateTime(2026, 10, 3),
        DateTime(2026, 10, 7),
        "Bungee jumping and rafting",
        TripStatus.planning,
      ),
      Trip(
        18,
        "Heritage Walk",
        DateTime(2026, 10, 15),
        DateTime(2026, 10, 16),
        "Walking through historic sites",
        TripStatus.planning,
      ),
      Trip(
        19,
        "Winter Holiday",
        DateTime(2026, 11, 20),
        DateTime(2026, 11, 30),
        "Christmas markets and snow",
        TripStatus.planning,
      ),
      Trip(
        20,
        "New Year Trip",
        DateTime(2026, 12, 28),
        DateTime(2027, 1, 2),
        "Welcoming the new year abroad",
        TripStatus.planning,
      ),
    ];
    return trips;
  }
}

extension DateTimeExtension on DateTime {
  bool isUpComing() => isAfter(DateTime.now());
}

class Trip {
  int id;
  String name;
  DateTime startDate;
  DateTime endDate;
  String? description;
  TripStatus status;

  Trip(
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.description,
    this.status,
  );
}

enum TripStatus { planning, active, completed }
