import '../../../models/employee_model.dart';

abstract class EmployeeServiceAbstract {
  Future<EmployeeModel> getEmployeeByCode(String code);
}
