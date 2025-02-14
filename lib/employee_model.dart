class Employee {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
