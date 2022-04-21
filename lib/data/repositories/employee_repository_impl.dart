import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/platform/network_info.dart';
import '../../domain/entities/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/remote/services/employee_service.dart';

class EmployeeRepositoryImpl implements EmployeeRepositoryAbstract {
  final EmployeeServiceAbstract service;
  final NetworkInfoAbstract netWorkInfo;
  EmployeeRepositoryImpl({
    required this.service,
    required this.netWorkInfo,
  });
  @override
  Future<Either<Failure, Employee>> getEmployeeByCode(String code) async {
    if (await netWorkInfo.isConnected) {
      try {
        var result = await service.getEmployeeByCode(code);
        return Right(result);
      } on Exception catch (ex) {
        return Left(ex.toFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
