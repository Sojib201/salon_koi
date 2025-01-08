class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class Services {
  final String id;
  final String name;
  final double price;

  Services({required this.id, required this.name, required this.price});
}

class Appointment {
  final String id;
  final String userId;
  final String serviceId;
  final DateTime date;

  Appointment({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.date,
  });
}
