class Worker {
  const Worker({
    required this.name,
    required this.lastName,
    required this.works,
    required this.location,
    required this.rating,
  });

  final String name;
  final String lastName;
  final List<String> works;
  final String location;
  final double rating;
}
