class Employee {
  final String userId;
  final String jobTitleName;
  final String firstName;
  final String lastName;
  final String preferredFullName;
  final String employeeCode;
  final String region;
  final String phoneNumber;
  final String emailAddress;

  Employee({
    required this.userId,
    required this.jobTitleName,
    required this.firstName,
    required this.lastName,
    required this.preferredFullName,
    required this.employeeCode,
    required this.region,
    required this.phoneNumber,
    required this.emailAddress,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      userId: json['userId'],
      jobTitleName: json['jobTitleName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      preferredFullName: json['preferredFullName'],
      employeeCode: json['employeeCode'],
      region: json['region'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
    );
  }
}