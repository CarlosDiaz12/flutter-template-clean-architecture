import 'package:flutter_template_clean_architecture/domain/entities/employee.dart';
import 'package:flutter_template_clean_architecture/domain/usecases/get_employee_by_code.dart'
    as get_employee_by_code;
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final get_employee_by_code.GetEmployeeByCode getEmployeeByCode;
  Employee? _employee;
  Employee? get employee => _employee;
  HomeViewModel({
    required this.getEmployeeByCode,
  });

  Future<void> callApi() async {
    clearErrors();
    setBusyForObject(_employee, true);
    var useCaseParams = get_employee_by_code.Params(code: '1234');
    var response = await getEmployeeByCode.execute(useCaseParams);
    response.fold((ex) {
      setError(ex);
    }, (data) {
      _employee = data;
    });
    setBusyForObject(_employee, false);
  }
}
