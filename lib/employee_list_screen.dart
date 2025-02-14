import 'package:employee_list/employee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_model.dart';
import 'employee_cubit.dart';

class EmployeeListScreen extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeListScreen({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeCubit()..loadEmployees(employees),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Employee List'),
        ),
        body: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoaded) {
              return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  final employee = state.employees[index];
                  return ListTile(
                    title: Text(employee.preferredFullName),
                    subtitle: Text(employee.jobTitleName),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeDetailScreen(employee: employee),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

