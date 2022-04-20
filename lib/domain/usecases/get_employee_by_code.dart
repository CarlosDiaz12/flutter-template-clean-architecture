import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/employee.dart';
import '../repositories/employee_repository.dart';
import 'usecase.dart';

class GetEmployeeByCode extends UseCase<Employee, Params> {
  final EmployeeRepositoryAbstract employeeRepository;
  GetEmployeeByCode({required this.employeeRepository});

  @override
  Future<Either<Failure, Employee>> execute(Params params) {
    return employeeRepository.getEmployeeByCode(params.code);
  }
}

class Params {
  String code;
  Params({
    required this.code,
  });
}
