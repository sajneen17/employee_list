import 'package:employee_list/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'employee_model.dart';

void main() {
  const jsonData = '''
  {
    "Employees": [
      {
        "userId": "rirani",
        "jobTitleName": "Developer",
        "firstName": "Romin",
        "lastName": "Irani",
        "preferredFullName": "Romin Irani",
        "employeeCode": "E1",
        "region": "CA",
        "phoneNumber": "408-1234567",
        "emailAddress": "romin.k.irani@gmail.com"
      },
      {
        "userId": "nirani",
        "jobTitleName": "Developer",
        "firstName": "Neil",
        "lastName": "Irani",
        "preferredFullName": "Neil Irani",
        "employeeCode": "E2",
        "region": "CA",
        "phoneNumber": "408-1111111",
        "emailAddress": "neilrirani@gmail.com"
      },
      {
        "userId": "thanks",
        "jobTitleName": "Program Directory",
        "firstName": "Tom",
        "lastName": "Hanks",
        "preferredFullName": "Tom Hanks",
        "employeeCode": "E3",
        "region": "CA",
        "phoneNumber": "408-2222222",
        "emailAddress": "tomhanks@gmail.com"
      }
    ]
  }
  ''';

  final employees = (jsonDecode(jsonData)['Employees'] as List)
      .map((e) => Employee.fromJson(e))
      .toList();

  runApp(MyApp(employees: employees));
}

class MyApp extends StatelessWidget {
  final List<Employee> employees;

  const MyApp({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeListScreen(employees: employees),
    );
  }
}