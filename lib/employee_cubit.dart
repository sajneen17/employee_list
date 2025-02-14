import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'employee_model.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  List<Employee> employees = [];

  void loadEmployees(List<Employee> employeeList) {
    employees = employeeList;
    emit(EmployeeLoaded(employees));
  }
}