import 'package:flutter_template_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_template_clean_architecture/data/datasources/remote/services/employee_service.dart';
import 'package:flutter_template_clean_architecture/domain/entities/employee.dart';
import 'package:flutter_template_clean_architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template_clean_architecture/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepositoryAbstract {
  final EmployeeServiceAbstract service;
  final NetworkInfoAbstract netWorkInfo;
  EmployeeRepositoryImpl({
    required this.service,
    required this.netWorkInfo,
  });
  @override
  Future<Either<Failure, Employee>> getEmployeeByCode(String code) {
    throw UnimplementedError();
  }
}
