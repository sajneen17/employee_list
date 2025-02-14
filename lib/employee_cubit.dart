import 'package:bloc/bloc.dart';
import 'package:employee_list/data.dart';
import 'package:employee_list/employee_model.dart';
import 'employee_state.dart';


class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  void loadEmployees() {
    List<Employee> employees = getDummyEmployees();
    emit(EmployeeLoaded(employees));
  }


  void searchEmployees(String query) {
    List<Employee> employees = getDummyEmployees();
    final filteredEmployees = employees
        .where((employee) =>
        employee.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(EmployeeLoaded(filteredEmployees));
  }
}
