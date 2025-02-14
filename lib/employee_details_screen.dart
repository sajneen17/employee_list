import 'package:employee_list/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.preferredFullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Job Title: ${employee.jobTitleName}'),
            Text('Employee Code: ${employee.employeeCode}'),
            Text('Region: ${employee.region}'),
            Text('Phone: ${employee.phoneNumber}'),
            Text('Email: ${employee.emailAddress}'),
          ],
        ),
      ),
    );
  }
}