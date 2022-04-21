import 'package:dio/dio.dart';
import 'package:flutter_template_clean_architecture/core/network/network_info.dart';
import 'package:flutter_template_clean_architecture/data/datasources/remote/services/employee_service.dart';
import 'package:flutter_template_clean_architecture/data/repositories/employee_repository_impl.dart';
import 'package:flutter_template_clean_architecture/domain/repositories/employee_repository.dart';
import 'package:flutter_template_clean_architecture/domain/usecases/get_employee_by_code.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'enviroment_config.dart';

class InjectionContainer {
  static List<SingleChildWidget> _providers = [];

  static final List<SingleChildWidget> _independentServicesProviders = [
    Provider.value(value: InternetConnectionChecker()),
    ProxyProvider<InternetConnectionChecker, NetworkInfoAbstract>(
      update: (context, connectionChecker, _) =>
          NetworkInfoImpl(connectionChecker: connectionChecker),
    ),
    Provider.value(value: _createDioClient()),
    // Provider<DeviceInformation>.value(value: DeviceInformationImpl()),
  ];

  static final List<SingleChildWidget> _networkDataSourceProviders = [
    // ProxyProvider2<DeviceInformation, UserDao, RequestBuilder>(
    //   update: (context, deviceInformation, dao, _) =>
    //       RequestBuilder(dao, deviceInformation),
    // ),
    ProxyProvider<Dio, EmployeeServiceAbstract>(
      update: (context, dioClient, _) => EmployeeServiceImpl(
        httpClient: dioClient,
      ),
    ),
  ];

  static final List<SingleChildWidget> _localDataSourceProviders = [];

  static final List<SingleChildWidget> _repositoryProviders = [
    ProxyProvider2<NetworkInfoAbstract, EmployeeServiceAbstract,
        EmployeeRepositoryAbstract>(
      update: (context, networkInfo, service, _) => EmployeeRepositoryImpl(
        service: service,
        netWorkInfo: networkInfo,
      ),
    ),
  ];

  static final List<SingleChildWidget> _usecasesProviders = [
    ProxyProvider<EmployeeRepositoryAbstract, GetEmployeeByCode>(
      update: (context, repository, _) => GetEmployeeByCode(
        employeeRepository: repository,
      ),
    ),
  ];

  static final List<SingleChildWidget> _uiConsumableProviders = [];
  static List<SingleChildWidget> get providers => _providers;
  InjectionContainer._();

  static Future<void> setupProvider() async {
    _providers = [
      ..._independentServicesProviders,
      ..._localDataSourceProviders,
      ..._networkDataSourceProviders,
      ..._repositoryProviders,
      ..._usecasesProviders,
      ..._uiConsumableProviders,
    ];
  }

  static Dio _createDioClient() {
    var client = Dio(
      BaseOptions(
        connectTimeout: 100000000,
        receiveTimeout: 100000000,
        baseUrl: EnviromentConfig.API,
      ),
    );
    // _addInterceptors(client);
    return client;
  }
}
