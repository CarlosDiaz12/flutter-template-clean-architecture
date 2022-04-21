import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfoAbstract {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfoAbstract {
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl({
    required this.connectionChecker,
  });
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
