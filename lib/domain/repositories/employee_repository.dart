import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/employee.dart';

abstract class EmployeeRepositoryAbstract {
  Future<Either<Failure, Employee>> getEmployeeByCode(String code);
}
