import 'package:flutter_template_clean_architecture/domain/usecases/get_employee_by_code.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final GetEmployeeByCode getEmployeeByCode;
  HomeViewModel({
    required this.getEmployeeByCode,
  });
}
