import 'package:employee_tracker/data/employee_model.dart';
import 'package:employee_tracker/db/db_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  return await DBHelper.fetchEmployees();
});
