import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../models/employee_model.dart';
import '../response/get_employee_by_code_response.dart';

abstract class EmployeeServiceAbstract {
  Future<EmployeeModel> getEmployeeByCode(String code);
}

class EmployeeServiceImpl implements EmployeeServiceAbstract {
  Dio httpClient;
  EmployeeServiceImpl({
    required this.httpClient,
  });
  @override
  Future<EmployeeModel> getEmployeeByCode(String code) async {
    var request = await httpClient.get(
      '/employee',
      queryParameters: {'code': code},
    );
    var response = GetEmployeeByCodeResponse.fromMap(request.data);
    if (request.statusCode == 200) {
      return response.data;
    } else if (request.statusCode == 404) {
      throw NoDataException();
    } else {
      throw ServerException();
    }
  }
}
