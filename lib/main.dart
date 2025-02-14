import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_cubit.dart';
import 'employee_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployeeCubit()..loadEmployees(),
      child: const MaterialApp(
        title: 'Employee List',
        home: EmployeeListScreen(),
      ),
    );
  }
}
