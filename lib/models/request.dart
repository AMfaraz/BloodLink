class Request {
  final String name;
  final String bloodType;
  final int age;
  final String gender;
  final String urgency;

  Request(
      {required this.age,
      required this.bloodType,
      required this.gender,
      required this.name,
      required this.urgency});
}
