import 'package:employee_list/employee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_cubit.dart';
import 'employee_state.dart';


class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                context.read<EmployeeCubit>().searchEmployees(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search by name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<EmployeeCubit, EmployeeState>(
              builder: (context, state) {
                if (state is EmployeeInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EmployeeLoaded) {
                  final employees = state.employees;
                  if (employees.isEmpty) {
                    return const Center(child: Text('No employees found.'));
                  }
                  return ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(employee.name),
                        subtitle: Text(employee.email),
                        trailing: Text(employee.phoneNumber),
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
                } else if (state is EmployeeError) {
                  return const Center(child: Text('Error loading employees.'));
                }
                return const Center(child: Text('Unknown state.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
